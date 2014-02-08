class Widget < ActiveRecord::Base
  validates :title, presence: true
end
