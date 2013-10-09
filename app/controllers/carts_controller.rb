class CartsController < ApplicationController
 before_filter :set_cart, only: [:create]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    product = Product.find(params[:product_id])

    @line_item = @cart.line_items.build

    @line_item.product = product
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @line_item.cart,

          notice: 'Line item was successfully created.' }

        format.json { render json: @line_item,

          status: :created, location: @line_item }
      else
        format.html { redirect_to @line_item.cart,

          notice: 'Line item was successfully created.' }

        format.json { render json: @line_item,

          status: :created, location: @line_item }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
