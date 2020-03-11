class Friend < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:user_id]
  belongs_to :user
end
