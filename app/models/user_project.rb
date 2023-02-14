class UserProject < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :project

  # validations
  validates :user_id, uniqueness: { scope: :project_id }
end