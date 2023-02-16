# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :group_and_users, dependent: :destroy
  has_many :groups, through: :group_and_users
  has_many :expense_details, dependent: :destroy
  has_many :expenses, through: :expense_details
  has_many :dealings
  has_many :rules
  has_many :debt_and_users
  has_many :debts, through: :debt_and_users

  validates :name, presence: true, length: { in: 1..20 }
end
