AUTH0_CONFIG = Rails.application.config_for(:auth0)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    AUTH0_CONFIG.auth0_client_id,
    AUTH0_CONFIG.auth0_client_secret,
    AUTH0_CONFIG.auth0_domain,
    callback_path: AUTH0_CONFIG.auth0_callback_url,
    authorize_params: {
      scope: 'openid profile email'
    }
  )
end