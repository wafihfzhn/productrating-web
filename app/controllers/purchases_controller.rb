class PurchasesController < ApplicationController
  before_action do
    @product = Product.find(params[:product_id])
    @store = Store.find(params[:store_id])

    case action_name.to_sym
    when :new, :create
      @purchase = @product.purchases.new
    when :show, :edit, :update, :destroy
      @purchase = @product.purchases.find(params[:id])
    end
  end

  def show
  end

  def new
  end

  def create
    # TODO: Also decrease product quantity.
    # - For example, if `purchase.quantity` is 3, decrease `product.quantity` by 3
    # - Display an error if `product.quantity` is less than 0 (negative number)
    @purchase.product = @product
    @purchase.assign_attributes(purchase_params)
    ActiveRecord::Base.transaction do
      @product.update!(quantity: @product.quantity - @purchase.quantity)
    end

    if @purchase.save
      redirect_to store_product_path(@store, @product)
    else
      flash[:error] = @purchase.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    # TODO: Show edit form
  end

  def update
    # TODO: Update record (save to database)
    if @purchase.update(purchase_params)
      redirect_to store_product_path(@store, @product)
    else
      render :edit
    end
  end

  def destroy
    # TODO: Delete record
    @purchase.destroy
    redirect_to store_product_path(@store, @product)
  end

  private
    def purchase_params
      params.require(:purchase).permit(:quantity, :delivery_address)
    end
end  
