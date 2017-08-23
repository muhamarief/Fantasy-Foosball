class CreateGameAways < ActiveRecord::Migration[5.0]
  def change
    create_table :game_aways do |t|
      t.references :team
      t.timestamps
    end

    add_reference :games, :game_away
  end
end
