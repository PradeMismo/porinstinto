class Order < MailForm::Base

  attribute :name
  attribute :email
  attribute :phone
  attribute :address     
  attribute :message
  attribute :items

  validates_presence_of :name, :email, :message
  validates_email_format_of :email
  validates_plausible_phone :phone

  def headers
    {
      :subject => "Pedido desde la tienda web",
      :to => "porinstintogrupo@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end