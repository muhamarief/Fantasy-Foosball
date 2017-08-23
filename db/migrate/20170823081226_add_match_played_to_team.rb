class AddMatchPlayedToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :match_played, :integer, default: 0
  end
end
