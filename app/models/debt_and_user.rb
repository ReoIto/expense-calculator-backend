# == Schema Information
#
# Table name: debt_and_users
#
#  id           :uuid             not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  debt_id      :uuid             not null
#  from_user_id :uuid             not null
#  to_user_id   :uuid             not null
#
# Indexes
#
#  index_debt_and_users_on_debt_id       (debt_id)
#  index_debt_and_users_on_from_user_id  (from_user_id)
#  index_debt_and_users_on_to_user_id    (to_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (debt_id => debts.id)
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (to_user_id => users.id)
#
class DebtAndUser < ApplicationRecord
  belongs_to :debt
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
end
