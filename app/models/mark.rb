class Mark < ActiveRecord::Base
  attr_accessible :tag, :title, :url, :tag_list
  belongs_to :user

  validates :url, :presence => true
  validates :title, :length => 3..140, :presence => true

  acts_as_taggable

  def tags_listing=(tag_list)
    current_user.tag(self, :with => tag_list, :on => :tags)
  end

  def tags_listing
    self.tag_list.join(',')
  end
end
