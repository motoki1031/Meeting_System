# -*- coding: utf-8 -*-
class Meeting < ApplicationRecord
  acts_as_paranoid
  has_many :atendee
  has_many :presenter
  def view_title_times
     self.title + '(第' + self.times.to_s + '回)'
  end

  validates :title, presence:true
  validates :title, uniqueness: {scope:[:times]}
  validates :times, presence:true
  validates :title, length:{maximum: 255}
  validates :room, length:{maximum: 255}
  validates :category, length:{maximum: 255}
end
