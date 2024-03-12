class Task < ApplicationRecord
  belongs_to :category

  validates :title, :description, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validate :due_date_validity

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today

    errors.add(:due_date, I18n.t('errors.messages.invalid_due_date'))
  end
end

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  due_date    :date
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_tasks_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
