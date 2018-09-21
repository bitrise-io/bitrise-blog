require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://blog.bitrise.io"
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.public_path = 'public/sitemaps/'
SitemapGenerator::Sitemap.include_root = true
SitemapGenerator::Sitemap.compress = true

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

  @tags = ButterCMS::Tag.all()
  @categories = ButterCMS::Category.all()
  @authors = ButterCMS::Author.all()

  page = 1
  loop do
    posts = ButterCMS::Post.all(
      page: page,
      page_size: 100
    )
    page = posts.meta.next_page

    posts.each do |a_post|
      if a_post.slug.present?
        add buttercms_post_path(a_post.slug), :lastmod => a_post.published
      end
    end

    break if page.nil?
  end

  @authors.each do |an_author|
    if an_author.slug.present?
      add buttercms_author_path(an_author.slug)
    end
  end

  @tags.each do |a_tag|
    if a_tag.slug.present?
      add buttercms_tag_path(a_tag.slug)
    end
  end

  @categories.each do |a_category|
    if a_category.slug.present?
      add buttercms_category_path(a_category.slug)
    end
  end

  add '/rss'
  add '/atom'
end

# Not needed if you use the rake tasks
# SitemapGenerator::Sitemap.ping_search_engines
