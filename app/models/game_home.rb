class GameHome < ApplicationRecord

  belongs_to :team

  validate :team_id, presence: true
end
