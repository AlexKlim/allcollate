require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.allcollate.com'

SitemapGenerator::Sitemap.sitemaps_host = "https://#{Rails.application.credentials.aws[:fog_upload_bucket]}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path += 'tmp/' unless File.split(SitemapGenerator::Sitemap.public_path).include?('tmp')
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
                                     aws_access_key_id: Rails.application.credentials.aws[:uploads_access_key_id],
                                     aws_secret_access_key: Rails.application.credentials.aws[:uploads_secret_access_key],
                                     fog_directory: Rails.application.credentials.aws[:fog_upload_bucket],
                                     fog_region: 'us-east-1')

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly', priority: 1

  Hotel.active.find_each do |hotel|
    add hotel_path(hotel), lastmod: I18n.l(hotel.updated_at, format: :w3c), changefreq: 'weekly', priority: 1.0
  end
end