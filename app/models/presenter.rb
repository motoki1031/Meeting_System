class Presenter < ApplicationRecord
  belongs_to:meeting
  has_one:user
  validates :title, length: {maximum: 255}
  attr_accessor :file
  validates :filepath, uniqueness: true, allow_nil: true
  validates :name, uniqueness: {scope:[:meeting_id]}
  validates :name, presence: true
  validates :title, presence: true
  validates :meeting_id, presence: true
end
