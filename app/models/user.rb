class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { manager: 0, developer: 1, QA: 2 }
  
  # associations
  has_many :projects
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :created_bugs, class_name: 'Bug', foreign_key: :creator_id
  has_many :solved_bugs, class_name: 'Bug', foreign_key: :solver_id

  # validations
  validates :name, presence: true
  validates :user_type, presence: true
end
