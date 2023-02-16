# == Schema Information
#
# Table name: groups
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  has_many :group_and_users, dependent: :destroy
  has_many :users, through: :group_and_users
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { in: 1..20 }
  validates :description, length: { maximum: 100 }
end
