# == Schema Information
#
# Table name: debts
#
#  id         :uuid             not null, primary key
#  amount     :integer          default(0), not null
#  status     :integer          default("waiting"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Debt < ApplicationRecord
  has_many :from_user, class_name: "User", through: :debt_and_users
  has_many :to_user, class_name: "User", through: :debt_and_users

  validates :amount, numericality: true
  validates :status, numericality: true

  enum status: {
    waiting: 0,
    completed: 1,
    pending: 2
  }
end
