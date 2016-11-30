class ContactsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Gracias por tu mensaje! En breve nos pondremos en contacto contigo.'
      render :new
    else
      flash[:error] = 'Error: no se ha podido enviar el mensaje.'
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email , :message, :nickname)
  end
end
