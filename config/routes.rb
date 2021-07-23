require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'frontend/home#index'
  get 'ping', to: 'home#ping'

  post 'subscriptions', to: 'subscriptions#create'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest('admin')) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest('admin'))
  end if Rails.env.production?

  mount Sidekiq::Web, at: "/sidekiq"

  get '/sitemap.xml' => redirect('https://et-allcollate-production.s3.amazonaws.com/sitemaps/sitemap.xml', status: 301)

  scope module: 'frontend' do
    resource :search, only: :show do
      get :suggestions
    end

    resources :comparisons, only: [:index]
  end

  namespace 'api' do
    resources :search, only: [:index] do
      collection do
        get :locations
      end
    end

    resources :comparisons, only: [:index]
  end

  get '/directory/companies/:prefix' => 'frontend/directory/hotels#show', constraints: {
    prefix: /[a-z]|more/
  }, as: :hotel_directory

  get '/hotel/:id' => 'frontend/hotels#show', as: :hotel
end
