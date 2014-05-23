class CreateTeamLeaders < ActiveRecord::Migration
  def change
    create_table :team_leaders do |t|
      t.string :name, :limit => 100, :null => false
      t.string :surname, :limit => 100, :null => false
      t.integer :team_id
      t.integer :project_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.timestamps
    end
  end
end
