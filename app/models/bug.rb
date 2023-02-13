class Bug < ApplicationRecord
  self.inheritance_column = :kind

  enum type: [:feature, :bug]

  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :solver, class_name: 'User', foreign_key: :solver_id

  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :description, presence: true
  validates :deadline, presence: true
  validates :type, presence: true
  validates :status, presence: true 
  
  mount_uploader :screenshot, ScreenshotUploader
end