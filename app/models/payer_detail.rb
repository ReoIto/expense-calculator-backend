# == Schema Information
#
# Table name: expense_details
#
#  id         :uuid             not null, primary key
#  amount     :integer
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_expense_details_on_expense_id  (expense_id)
#  index_expense_details_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (user_id => users.id)
#
class PayerDetail < ExpenseDetail
end
