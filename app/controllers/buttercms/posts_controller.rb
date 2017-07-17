class Buttercms::PostsController < Buttercms::BaseController
  def index
    tag = ButterCMS::Tag.find("prio", include: 'recent_posts')
    @featured_post = tag.data.recent_posts.first unless tag.nil?

    @posts = ButterCMS::Post.all(:page => params[:page], :page_size => 10)

    @next_page = @posts.meta.next_page
    @previous_page = @posts.meta.previous_page
  end

  def show
    @post = ButterCMS::Post.find(params[:slug])

    @next_post = @post.meta.next_post
    @previous_post = @post.meta.previous_post
  end
end
