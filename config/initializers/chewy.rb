Chewy.settings = if Rails.env.development? || Rails.env.test?
  { host: 'localhost:9200', prefix: 'allcollacte_' }
else
  {
    host: 'http://my-es-instance-on-aws.us-east-1.es.amazonaws.com:80',
    port: 443,
    transport_options: {
      headers: { content_type: 'application/json' },
      proc: -> (f) do
          f.request :aws_sigv4,
                    service: 'es',
                    region: 'us-east-1',
                    access_key_id: ENV['AWS_ACCESS_KEY'],
                    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      end
    }
  }
end