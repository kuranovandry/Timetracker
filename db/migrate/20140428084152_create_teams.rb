class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.timestamps
      t.string :name, :limit => 50
      t.string :logo_url, :limit => 255
      t.string :manager, :limit => 100, :null => false
      t.integer :foundedd
    end
  end
end
