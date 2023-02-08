class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 150 } 
  belongs_to :user
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :bugs, dependent: :destroy
end