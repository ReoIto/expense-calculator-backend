# == Schema Information
#
# Table name: payment_methods
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#
# Indexes
#
#  index_payment_methods_on_expense_id  (expense_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#
class PaymentMethod < ApplicationRecord
  belongs_to :expense

  validates :name, length: { in: 1..20 }
end
