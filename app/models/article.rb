class Article < ApplicationRecord
  include Visible
  
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :title_description, presence: true 
  validates :body, presence: true
end
