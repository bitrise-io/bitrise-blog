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
    if post_params[:page]
      @posts = ButterCMS::Post.all(:page => post_params[:page], :page_size => 3)
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

  def search_post
    @search_query = params[:query]
    render :search
  end

  def search
    page = post_params[:page] || 1
    page_size = post_params[:page] ? 6 : 100

    @posts = ButterCMS::Post.search(post_params[:query], {page: page, page_size: page_size})

    render 'search'

    rescue => ex
    if ex.class == ButterCMS::NotFound
      json_response(ex, :not_found)
    else
      json_response(ex, :internal_server)
    end
  end

private
  def post_params
    params.require(:post).permit(:query, :page, :page_size)
  end

  def set_variables
    @categories = ButterCMS::Category.all
  end
end
