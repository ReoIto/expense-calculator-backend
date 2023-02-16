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

# # 誰が
# group.expenses.first.payer_details.first.user

# # 誰の
# group.expenses.first.payee_details.first.user

# # 何を支払って
# group.expenses.first.expense_reason

# # いくらかかった
# group.expenses.first.payer_details.first.amount

# # いくら支払う
# group.expenses.first.payee_details.first.amount

# bundle exec rails g migration AddExpenseReasonToExpense expense_reason:string
# bundle exec rails g migration ChangeExpenseAndUserToExpenseDetail
# def change
#   rename_table :expense_and_users, :expense_details
# end
# bundle exec rails g migration AddAmountToExpenseDetail amount:integer
# bundle exec rails g migration AddTypeToExpenseDetail type:string