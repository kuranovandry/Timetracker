class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.timestamps
      t.string :name, :limit => 100, :null => false
      t.string :surname, :limit => 100, :null => false
      t.string :position, :null => false
      t.boolean :retired, :default => false
      t.integer :team_id
      t.integer :project_id
      t.text :notes
      t.string :my_project
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :deleted_at
    end
  end
end
