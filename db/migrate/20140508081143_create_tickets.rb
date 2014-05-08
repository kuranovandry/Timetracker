class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :case_id
      t.date :date
      t.text :description
      t.float :spent
      
      t.timestamps
    end
  end
end
