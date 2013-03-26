class Mark < ActiveRecord::Base
  attr_accessible :tag, :title, :url, :user_id
  belongs_to :user

  validates :url, :presence => true
  validates :title, :length => 3..140, :presence => true
end
