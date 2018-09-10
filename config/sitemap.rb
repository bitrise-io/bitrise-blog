require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://blog.bitrise.io"
SitemapGenerator::Sitemap.include_root = true
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create_index = true

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/'
  add '/rss'
  add '/atom'

  @tags = ButterCMS::Tag.all()
  @categories = ButterCMS::Category.all()
  @authors = ButterCMS::Author.all()
  @posts = ButterCMS::Post.all(
    page: 1,
    page_size: 100000
  )

  @tags.find_each do |a_tag|
    add buttercms_tag_path(a_tag)
  end
  @categories.find_each do |a_categories|
    add buttercms_tag_path(a_categories)
  end
  @authors.find_each do |an_authors|
    add buttercms_tag_path(an_authors)
  end
  @posts.find_each do |a_post|
    add buttercms_post_path(a_post), :lastmod => a_post.updated_at
  end
end

SitemapGenerator::Sitemap.ping_search_engines
