class Order < MailForm::Base
  # ATTRIBUTES
  attribute :name
  attribute :email
  attribute :message
  attribute :phone_number
  attribute :address     
  attribute :items
  attribute :nickname,  :captcha  => true
  
  # VALIDATIONS
  validates_presence_of     :name, :email, :address
  validates_email_format_of :email
  validates                 :phone_number,:presence     => true,
                                          :numericality => true,
                                          :length       => { :minimum => 6, :maximum => 9 }

  # METHODS
  def headers
    {
      :subject => "Pedido desde la tienda web",
      :to => "porinstintogrupo@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end