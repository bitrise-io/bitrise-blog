class Buttercms::CategoriesController < Buttercms::BaseController
  before_action :set_variables

  def show
    @category = ButterCMS::Category.find(params[:slug], :include => :recent_posts)
  end
private
  def set_variables
    @categories = ButterCMS::Category.all
  end
end