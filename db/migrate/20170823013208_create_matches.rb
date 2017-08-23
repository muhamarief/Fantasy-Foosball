class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :winner
      t.integer :loser

      t.timestamps
    end

    add_reference :games, :match
  end
end
