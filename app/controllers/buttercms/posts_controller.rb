class Buttercms::PostsController < Buttercms::BaseController
  before_action :set_variables

  def index
    tag = ButterCMS::Tag.find("prio", include: 'recent_posts')
    @featured_post = tag.data.recent_posts.first unless tag.nil?

    @posts = ButterCMS::Post.all(:page => params[:page], :page_size => 9)

    @next_page = @posts.meta.next_page
    @previous_page = @posts.meta.previous_page
  end

  def show
    @post = ButterCMS::Post.find(params[:slug])

    @next_post = @post.meta.next_post
    @previous_post = @post.meta.previous_post
  end

  def fetch_posts
    if params[:page]
      @posts = ButterCMS::Post.all(:page => params[:page], :page_size => 3)
    else
      @posts = ButterCMS::Post.all
    end

    respond_to do |format|
      format.json{ json_response(@posts) }
    end
  rescue => ex
    if ex.class == ButterCMS::NotFound
      json_response(ex, :not_found)
    else
      json_response(ex, :internal_server)
    end
  end

private
  def set_variables
    @categories = ButterCMS::Category.all
  end
end
