class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Gracias por tu mensaje! En breve nos pondremos en contacto contigo.'
      render :new
    else
      flash[:error] = 'Error: no se ha podido enviar el mensaje.'
      render :new
    end
  end

end
