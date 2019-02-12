class GameSerializer < ActiveModel::Serializer
  attributes :id, :yourTeam, :opponentTeam, :won
  has_one :user
end
