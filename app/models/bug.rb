class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :solver, class_name: 'User', foreign_key: :solver_id

  mount_uploader :screenshot, ScreenshotUploader

  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :type, presence: true
  validates :status, presence: true

  
end