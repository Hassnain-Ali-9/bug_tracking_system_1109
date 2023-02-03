class UsersProject < ActiveRecord::Migration[7.0]
  def change
    create_table :users_project do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
  end
end
