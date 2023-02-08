class User < ApplicationRecord
  validates :name, presence: true
  enum user_type: { manager: 0, developer: 1, QA: 2 }
  validates :user_type, presence: true
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :created_bugs, class_name: 'Bug', foreign_key: :creator_id
  has_many :solved_bugs, class_name: 'Bug', foreign_key: :solver_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




end
