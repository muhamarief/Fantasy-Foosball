class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :away_score
      t.integer :home_score
      t.boolean :away_winner?
      t.boolean :home_winner?
      
      t.timestamps
    end
  end
end
