class ChangeColumnNamesToGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :away_winner?
    remove_column :games, :home_winner?

    add_column :games, :away_winner, :boolean, default: false
    add_column :games, :home_winner, :boolean, default: false
  end
end
