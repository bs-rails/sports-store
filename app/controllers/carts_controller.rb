class CartsController < ApplicationController
  include CurrentCart

  before_action :set_cart

  def show
  end

  def destroy
    @cart.destroy
    redirect_to root_path, notice: "Cart destroyed successfully!"
  end
end
