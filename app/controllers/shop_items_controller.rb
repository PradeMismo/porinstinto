class ShopItemsController < ApplicationController

  def new
    @shop_item = ShopItem.new
    flash.now[:tip] = "Adjunta una imagen. Asigna un valor de relevancia para posicionar el item en la tienda."  
  end 

  def create
    @shop_item = ShopItem.new(params[:shop_item])

    if @shop_item.save
      flash[:success] = "Shop Item succesfully created"
      redirect_to new_order_path
    else
      flash[:error] = "Error: shop item couldn't be created"
      render action: "new"
    end
  end


  def edit
    @shop_item = ShopItem.find(params[:id])
  end

  def update
    @shop_item = ShopItem.find(params[:id])
    if @shop_item.update_attributes(params[:shop_item])
      flash[:success] = "Shop Item succesfully updated"
      redirect_to new_order_path
    else
      flash[:error] = "Error: shop_item couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @shop_item = ShopItem.find(params[:id])
    @shop_item.destroy
    flash[:success] = 'ShopItem deleted'
    redirect_to new_order_path
  end

end
