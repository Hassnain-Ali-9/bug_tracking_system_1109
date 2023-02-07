class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :deadline
      t.string :screenshot
      t.string :type, null: false
      t.string :status, null: false
      t.integer :project_id, null: false
      t.integer :creator_id, null: false
      t.integer :solver_id, null: false

      t.timestamps

    end
    add_index :bugs, :title, unique: true
    add_foreign_key :bugs, :users, column: :creator_id
    add_foreign_key :bugs, :users, column: :solver_id
    add_foreign_key :bugs, :projects
    
  end
end
