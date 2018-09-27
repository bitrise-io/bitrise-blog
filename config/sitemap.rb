require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://blog.bitrise.io"
SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3.amazonaws.com/#{ ENV['AWS_S3_BUCKET'] }/sitemap.xml"
SitemapGenerator::Sitemap.include_root = true
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new("#{ENV['AWS_S3_BUCKET']}",
  aws_access_key_id: "#{ENV['AWS_ACCESS_KEY_ID']}",
  aws_secret_access_key: "#{ENV['AWS_SECRET_ACCESS_KEY']}",
  aws_region: "#{ENV['AWS_REGION']}"
)

SitemapGenerator::Sitemap.create do
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
        add buttercms_post_path(a_post.slug), :lastmod => a_post.published, :changefreq => 'daily', :priority => 0.9
      end
    end

    break if page.nil?
  end

  @authors.each do |an_author|
    if an_author.slug.present?
      add buttercms_author_path(an_author.slug), :changefreq => 'monthly', :priority => 0.8
    end
  end

  @tags.each do |a_tag|
    if a_tag.slug.present?
      add buttercms_tag_path(a_tag.slug), :changefreq => 'monthly', :priority => 0.7
    end
  end

  @categories.each do |a_category|
    if a_category.slug.present?
      add buttercms_category_path(a_category.slug), :changefreq => 'monthly', :priority => 0.6
    end
  end

  add '/rss'
  add '/atom'
end

# Not needed if you use the rake tasks
# SitemapGenerator::Sitemap.ping_search_engines
