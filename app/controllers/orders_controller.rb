=beginclass OrdersController < ApplicationController
  authorize_resource

  def new
    @shop_items = ShopItem.all
    if @shop_items.present?
      @order = Order.new
    else
      flash.now[:info] = "Actualmente no tenemos nada en venta." 
    end
  end

  def create
    @order = Order.new(order_params)
    @shop_items = params[:shop_items] 
    @order.items = @shop_items.map(&:inspect).join(', ') if @shop_items.present?
    @order.request = request
    if @order.deliver
      flash[:success] = 'Gracias por tu pedido! En breve nos pondremos en contacto contigo para confirmarlo.'
      redirect_to new_order_path
    else
      flash[:error] = 'Error: no se ha podido enviar el pedido.'
      redirect_to new_order_path
    end
  end
  

  private

  def order_params
    params.require(:order).permit(:name, :email, :message, :phone_number, :address, :items, :nickname)
  end
end=end