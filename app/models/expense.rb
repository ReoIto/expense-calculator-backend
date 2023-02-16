# == Schema Information
#
# Table name: expenses
#
#  id             :uuid             not null, primary key
#  amount         :integer          default(0), not null
#  expense_reason :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  group_id       :uuid             not null
#
# Indexes
#
#  index_expenses_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Expense < ApplicationRecord
  has_many :payer_details, dependent: :destroy
  has_many :payee_details, dependent: :destroy
  has_many :expense_and_rules, dependent: :destroy
  has_many :rules, through: :expense_and_rules
  belongs_to :group

  validates :amount, numericality: true
end