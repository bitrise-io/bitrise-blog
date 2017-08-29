class Buttercms::CategoriesController < Buttercms::BaseController
  before_action :set_variables

  def show
    @category = ButterCMS::Category.find(params[:slug], :include => :recent_posts)
  end

  def fetch_posts
    if params[:page]
      @posts = ButterCMS::Post.all(:page => params[:page], :page_size => 3, category_slug: params[:slug])
      @number_of_posts = @posts.meta.count
      @next_page = @posts.meta.next_page
    else
      @posts = ButterCMS::Post.all
    end

    respond_to do |format|
      format.json{ json_response({posts: @posts, total_count: @number_of_posts, next_page: @next_page}) }
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