class ShopItem < ActiveRecord::Base
  has_attached_file :image, :styles => {:cover => "180x180>"}, dependent: :destroy

  validates_presence_of :name, :price, :description, :relevance
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  default_scope  { order(:relevance => :desc) }
end