class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :number
      t.timestamps
    end

    add_index "cases", "number"
  end
end
