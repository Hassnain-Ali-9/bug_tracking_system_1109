class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :bugs, dependent: :destroy
  belongs_to :user

  # validations
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 150 } 
end