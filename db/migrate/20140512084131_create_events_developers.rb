class CreateEventsDevelopers < ActiveRecord::Migration
  def change
    create_table :events_developers do |t|
    	t.integer  :event_id
    	t.integer  :developer_id
      t.timestamps
    end
  end
end
