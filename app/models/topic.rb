class Topic < ActiveRecord::Base
  has_many :posts

  # set pagination per_page default
  self.per_page = 100
end
