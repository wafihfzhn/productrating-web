# TODO: Implement 
class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to stores_path
    else
      flash[:error] = @store.errors.full_messages
      render :new
    end
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end
end
