class HomeController < ApplicationController
  include Pagy::Backend
  include CurrentCart
  before_action :set_cart

  def index
    @categories = Category.all.load_async
    if params[:category]
      @category = Category.find_by_name params[:category]
      products = @category.products.load_async
    else
      products = Product.all.load_async
    end
    @pagy, @products = pagy(products, items: per_page)
  end

  private

  def per_page
    # maximum items per page = 30
    # default items per page = 10
    if params[:per_page].to_i.zero?
      10
    else
      [params[:per_page].to_i, 30].min
    end
  end
end
