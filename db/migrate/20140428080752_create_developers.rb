class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.timestamps
      t.datetime :deleted_at
      t.integer :team_id
      t.string :name, :limit => 100, :null => false
      t.string :position, :limit => 50
      t.integer :number, :null => false
      t.boolean :retired, :default => false
      t.text :notes
    end
  end
end
