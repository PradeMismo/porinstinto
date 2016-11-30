class ShopItemsController < ApplicationController
  load_and_authorize_resource

  def new
    flash.now[:tip] = "Adjunta una imagen. Asigna un valor de relevancia para posicionar el item en la tienda."  
  end 

  def create
    @shop_item = ShopItem.new(shop_item_params)
    if @shop_item.save
      flash[:success] = "Shop Item succesfully created"
      redirect_to new_order_path
    else
      flash[:error] = "Error: shop item couldn't be created"
      render action: "new"
    end
  end


  def edit
  end

  def update
    if @shop_item.update_attributes(shop_item_params)
      flash[:success] = "Shop Item succesfully updated"
      redirect_to new_order_path
    else
      flash[:error] = "Error: shop_item couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @shop_item.destroy
    flash[:success] = 'ShopItem deleted'
    redirect_to new_order_path
  end
  

  private

  def shop_item_params
    params.require(:shop_item).permit(:name, :description, :external_shop_link, :price, :image, :relevance)
  end
end