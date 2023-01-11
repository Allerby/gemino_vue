class Category < ApplicationRecord
  has_many :transactions
  has_many :prospective_transactions, foreign_key: 'prospective_category_id', class_name: 'Transaction'

  scope :other, -> { find_by(name: 'Other') }
end
