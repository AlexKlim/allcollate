require 'faraday_middleware/aws_sigv4'

Chewy.settings = if Rails.env.development? || Rails.env.test?
  { host: 'localhost:9200', prefix: 'allcollacte_' }
else
  {
    host: "#{Rails.application.credentials.elastic_search[:host]}:443",
    port: 443,
    transport_options: {
      headers: { content_type: 'application/json' },
      proc: -> (f) do
          f.request :aws_sigv4,
                    service: 'es',
                    region: 'us-east-1',
                    access_key_id: Rails.application.credentials.elastic_search[:user][:key_id],
                    secret_access_key: Rails.application.credentials.elastic_search[:user][:secret_key]
      end
    }
  }
end