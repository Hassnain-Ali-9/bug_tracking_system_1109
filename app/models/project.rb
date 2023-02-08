class Project < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true, length: { minimum: 5, maximum: 150 } 
	belongs_to :user
	#has_many :userprojects
    #has_many :users, through: :userprojects
    has_many :bugs
end