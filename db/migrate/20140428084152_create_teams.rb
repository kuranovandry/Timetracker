class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.timestamps
      t.string :name, :limit => 50
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.string :manager, :limit => 100, :null => false
    end
  end
end
