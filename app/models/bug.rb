class Bug < ApplicationRecord
    self.inheritance_column = :different_column_name
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :description, presence: true
  validates :deadline, presence: true
  mount_uploader :screenshot, ScreenshotUploader
  validates :type, presence: true
  validates :status, presence: true
  enum type: [:feature, :bug]


  
end