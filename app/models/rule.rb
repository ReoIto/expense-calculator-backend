# == Schema Information
#
# Table name: rules
#
#  id                   :uuid             not null, primary key
#  amount               :integer          default(0), not null
#  is_discount_rule     :boolean          default(FALSE), not null
#  is_extra_charge_rule :boolean          default(FALSE), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :uuid             not null
#
# Indexes
#
#  index_rules_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Rule < ApplicationRecord
  has_many :expense_and_rules
  has_many :expenses, through: :expense_and_rules
  belongs_to :user

  validates :amount, numericality: true
  validates :is_discount_rule, inclusion: { in: [true, false] }
  validates :is_extra_charge_rule, inclusion: { in: [true, false] }
end
