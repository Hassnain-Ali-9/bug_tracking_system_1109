class Bug < ApplicationRecord
  self.inheritance_column = :kind

  # associations
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :solver, class_name: 'User', foreign_key: :solver_id

  # validations
  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :description, presence: true
  validates :deadline, presence: true
  validates :type, presence: true
  validates :status, presence: true 
  validate :status_validation
  
  mount_uploader :screenshot, ScreenshotUploader

  def status_validation
    if type == 'bug'
     valid_statuses = ['new', 'started', 'resolved']
     errors.add(:status, "Invalid status for type bug") unless valid_statuses.include?(status)
    elsif type == 'feature'
     valid_statuses = ['new', 'started', 'completed']
     errors.add(:status, "Invalid status for type feature") unless valid_statuses.include?(status)
    end
  end
end



