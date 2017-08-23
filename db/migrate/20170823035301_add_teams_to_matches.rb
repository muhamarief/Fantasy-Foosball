class AddTeamsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :away_team_id, :integer, null: false
    add_column :matches, :home_team_id, :integer, null: false
  end
end
