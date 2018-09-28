class SitemapsController < ApplicationController
  def sitemap
    redirect_to "https://s3.amazonaws.com/#{ ENV['AWS_S3_BUCKET'] }/sitemap.xml"
  end
end
