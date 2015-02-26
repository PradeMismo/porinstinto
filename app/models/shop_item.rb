class ShopItem < ActiveRecord::Base
  attr_accessible :name, :description, :external_shop_link, :price, :image, :relevance

  has_attached_file :image, :styles => {:cover => "180x180>"}, dependent: :destroy

  validates_presence_of :name, :price, :description, :relevance
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  default_scope order('relevance DESC')

end
