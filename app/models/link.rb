class Link < ActiveRecord::Base

  has_many :comments
  belongs_to :submitter, :class_name => "User"

end
