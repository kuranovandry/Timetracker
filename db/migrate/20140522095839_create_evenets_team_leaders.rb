class CreateEvenetsTeamLeaders < ActiveRecord::Migration
  def change
    create_table :evenets_team_leaders do |t|
    	t.integer  :event_id
    	t.integer  :team_leader_id
      t.timestamps
    end
  end
end
