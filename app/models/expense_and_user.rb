# == Schema Information
#
# Table name: expense_and_users
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_expense_and_users_on_expense_id  (expense_id)
#  index_expense_and_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (user_id => users.id)
#
class ExpenseAndUser < ApplicationRecord
  belongs_to :expense
  belongs_to :user
end
