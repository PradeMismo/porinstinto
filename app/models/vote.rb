class Vote < ActiveRecord::Base
  attr_accessible :name, :email, :province, :comment, :song_ids

  has_and_belongs_to_many :songs

  validates_presence_of :name, :email
  validates_email_format_of :email
  validates_uniqueness_of :email

end
