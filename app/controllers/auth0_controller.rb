class Auth0Controller < ApplicationController
  AUTH0_CONFIG = Rails.application.config_for(:auth0)

  NOTICE_CONFIRM_EMAIL = 'Everything is almost done! Just the last step, please, confirm your email.'.freeze

  def authentication
    redirect_to(
      "https://#{AUTH0_CONFIG.auth0_domain}/authorize?" \
      "client_id=#{AUTH0_CONFIG.auth0_client_id}&" \
      'response_type=code&' \
      "redirect_uri=#{CGI.escape(AUTH0_CONFIG.auth0_callback_url)}"
    )
  end

  def callback
    user = find_or_create_user
    unless user.verified?
      reset_session
      redirect_to(logout_url, notice: NOTICE_CONFIRM_EMAIL) and return
    end

    session[:user_id] = user.id

    # OmniAuth stores the informatin returned from Auth0 and the IdP in request.env['omniauth.auth'].
    # In this code, you will pull the raw_info supplied from the id_token and assign it to the session.
    # Refer to https://github.com/auth0/omniauth-auth0#authentication-hash for complete information on 'omniauth.auth' contents.
    auth_info = request.env['omniauth.auth']
    session[:userinfo] = auth_info['extra']['raw_info']

    # Redirect to the URL you want after successful auth
    redirect_to search_path
  end

  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url
  end

  private

  def find_or_create_user
    auth_info = request.env.fetch('omniauth.auth')

    verified = auth_info&.extra&.raw_info&.email_verified
    info = auth_info.info

    user = User.find_by(email: info.email)

    if user
      user.update!(
        username: info.nickname,
        image: info.image,
        verified: verified,
        login_count: user.login_count + 1,
        last_login_at: DateTime.now
      )
      return user
    end

    User.create!(
      email: info.email, uid: auth_info.uid, username: info.nickname,
      image: info.image, verified: verified
    )
  end

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG['auth0_client_id']
    }

    URI::HTTPS.build(host: AUTH0_CONFIG['auth0_domain'], path: '/v2/logout', query: to_query(request_params)).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end