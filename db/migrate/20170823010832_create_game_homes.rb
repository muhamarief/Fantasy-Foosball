class CreateGameHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :game_homes do |t|
      t.references :team
      t.timestamps
    end

    add_reference :games, :game_home
  end
end
