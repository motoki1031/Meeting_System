class Atendee < ApplicationRecord
  belongs_to:meeting
  has_one:user
  validates :meeting_id, uniqueness: {scope:[:name]}
  validates :name, presence:true
  validates :meeting_id, presence:true
end
