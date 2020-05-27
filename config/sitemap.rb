require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.allcollate.com'

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add '/', changefreq: 'weekly', priority: 1
end