class Contact < MailForm::Base
  attribute :name
  attribute :email     
  attribute :message
  attribute :nickname,  :captcha  => true

  validates_presence_of :name, :email, :message
  validates_email_format_of :email

  def headers
    {
      :subject => "Contacto desde la web",
      :to => "porinstintogrupo@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end