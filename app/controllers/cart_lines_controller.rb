class CartLinesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: :create
  before_action :set_cart_line, only: %i[ show edit update destroy ]

  # GET /cart_lines or /cart_lines.json
  def index
    @cart_lines = CartLine.all
  end

  # GET /cart_lines/1 or /cart_lines/1.json
  def show
  end

  # GET /cart_lines/new
  def new
    @cart_line = CartLine.new
  end

  # GET /cart_lines/1/edit
  def edit
  end

  # POST /cart_lines or /cart_lines.json
  def create
    product = Product.find params[:product_id]

    if @cart.has_product product
      @cart_line = CartLine.where(product: product, cart: @cart).first
      @cart_line.quantity += 1
    else
      @cart_line = @cart.cart_lines.build(product: product)
    end

    respond_to do |format|
      if @cart_line.save
        format.html { redirect_to cart_path, notice: "#{product.name} was added to cart!" }
        format.json { render :show, status: :created, location: @cart_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_lines/1 or /cart_lines/1.json
  def update
    respond_to do |format|
      if @cart_line.update(quantity: params[:quantity])
        format.html { redirect_to cart_path }
        format.json { render :show, status: :ok, location: @cart_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_lines/1 or /cart_lines/1.json
  def destroy
    @cart_line.destroy

    respond_to do |format|
      format.html { redirect_to cart_lines_url, notice: "Cart line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_line
    @cart_line = CartLine.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_line_params
    params.require(:cart_line).permit(:product_id, :cart_id, :quantity)
  end
end
