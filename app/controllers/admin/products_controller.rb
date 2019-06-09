class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(4)
  end


  def create
    @new_cd = Product.new(products_params)
    if @new_cd.save
      flash[:cd] = "successful Created CD!!"
    else
      render :new
    end
    @new_cd.save!
  end

  def new
    @new_cd = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      flash[:notice_m] = "successful Edit CD"
    redirect_to admin_products_path
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.delete
       flash[:notice_m] = "successful Delete CD!!"
       redirect_to admin_products_path
    else
       @product = Product.all
       render "index"
    end
  end
  
  def change_status
    @history_item=HistoryItem.find(params[:history_item])
    @history_item.update(product_status: params[:status]) 
    redirect_to edit_admin_user_path(@history_item.id)
  end

  private
  def products_params
    params.require(:product).permit(:image, :product_title,:price,:label_name,:stock ,tracks_attributes: [:id,:product_id ,:track_name, :artist_name,:disk_num,:track_order, :_destroy])
  end
  
  def status_params
    params.require(:history_item).permit(:status)
  end
end
