class AddStatusForGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :status, :boolean
  end
end
