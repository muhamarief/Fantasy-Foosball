class Team < ApplicationRecord

  validates :name, presence: true

  has_many :users
  has_many :game_aways
  has_many :game_homes
  has_many :games, through: :game_aways
  has_many :games, through: :game_homes
end
