class Post < ApplicationRecord
	belongs_to :user, optional: true	
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :text,presence: true

end
