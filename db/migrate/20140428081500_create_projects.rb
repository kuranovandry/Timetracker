class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.timestamps
      t.integer :team_id
      t.date :date
      t.text :notes
    end
  end
end
