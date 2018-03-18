class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to:atendee, optional: true
  belongs_to:presenter, optional: true



  def view_name_grade
    self.name + '(' + self.grade + ')'
  end

  #emailの無しでも登録可能にする．
  def email_required?
    false
  end

  def email_changed?
    false
  end

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

end
