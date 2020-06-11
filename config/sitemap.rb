require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.allcollate.com'

SitemapGenerator::Sitemap.sitemaps_host = "https://#{Rails.application.credentials.aws[:fog_upload_bucket]}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path += 'tmp/' unless File.split(SitemapGenerator::Sitemap.public_path).include?('tmp')
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly', priority: 1

  Hotel.active.find_each do |hotel|
    add hotel_path(hotel), lastmod: I18n.l(hotel.updated_at, format: :w3c), changefreq: 'weekly', priority: 1.0
  end
end