# == Schema Information
#
# Table name: receipts
#
#  id         :uuid             not null, primary key
#  image_path :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :uuid             not null
#
# Indexes
#
#  index_receipts_on_expense_id  (expense_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#
class Receipt < ApplicationRecord
  belongs_to :expense

  validates :image_path, length: { maximum: 200 }
end
