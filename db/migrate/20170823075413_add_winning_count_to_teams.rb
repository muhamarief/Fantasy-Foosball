class AddWinningCountToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :winning_count, :integer, default: 0
  end
end
