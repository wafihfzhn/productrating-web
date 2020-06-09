class ProductsController < ApplicationController
  before_action do
    @store = Store.find(params[:store_id])

    case action_name.to_sym
    when :new, :create
      @product = Product.new
    when :show, :edit, :update, :destroy
      @product = Product.find(params[:id])
    end
  end

  def new
  end

  def create
    @product.assign_attributes(product_params)
    @product.store = @store

    if @product.save
      redirect_to store_products_path(@store)
    else
      flash[:error] = @product.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def index
    @store = Store.find(params[:store_id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :quantity, :price)
    end
end  
