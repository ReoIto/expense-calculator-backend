# == Schema Information
#
# Table name: dealings
#
#  id         :uuid             not null, primary key
#  status     :integer          default("waiting"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_dealings_on_expense_id  (expense_id)
#  index_dealings_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (user_id => users.id)
#
class Dealing < ApplicationRecord
  belongs_to :user
  belongs_to :expense

  validates :status, numericality: true

  enum status: {
    waiting: 0,
    completed: 1,
    pending: 2
  }
end
