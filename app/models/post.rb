class Post < ActiveRecord::Base

  validates_presence_of :content, :poster

end
