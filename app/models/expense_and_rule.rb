# == Schema Information
#
# Table name: expense_and_rules
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#  rule_id    :uuid             not null
#
# Indexes
#
#  index_expense_and_rules_on_expense_id  (expense_id)
#  index_expense_and_rules_on_rule_id     (rule_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (rule_id => rules.id)
#
class ExpenseAndRule < ApplicationRecord
  belongs_to :expense
  belongs_to :rule
end
