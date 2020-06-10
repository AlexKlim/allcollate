require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.allcollate.com'

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly', priority: 1

  Hotel.find_each do |hotel|
    add hotel_path(hotel), lastmod: I18n.l(hotel.updated_at, format: :w3c), changefreq: 'weekly', priority: 1.0
  end
end