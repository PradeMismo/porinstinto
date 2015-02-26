class OrdersController < ApplicationController

  def new
    @shop_items = ShopItem.all
    if @shop_items.present?
      @order = Order.new
    else
      flash.now[:info] = "Actualmente no tenemos nada en venta." 
    end
  end

  def create
    @order = Order.new(params[:order])
    @shop_items = params[:shop_items] 
    @order.items = @shop_items.map(&:inspect).join(', ')
    @order.request = request
    if @order.deliver
      flash[:success] = 'Gracias por tu pedido! En breve nos pondremos en contacto contigo para confirmarlo.'
      redirect_to new_order_path
    else
      flash[:error] = 'Error: no se ha podido enviar el pedido.'
      render :new
    end
  end

end