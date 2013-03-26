class Marks < ActiveRecord::Base
  attr_accessible :tag, :title, :url, :user_id
  belongs_to :user
end
