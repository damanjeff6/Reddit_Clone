class Sub < ActiveRecord::Base

  has_many :links
  belongs_to :moderator, :class_name => "User"

end