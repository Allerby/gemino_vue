class Transaction < ApplicationRecord
  belongs_to :category, required: false
  belongs_to :prospective_category, required: false, class_name: 'Category'

  belongs_to :user, required: true

  scope :other, lambda {
    joins(:prospective_category)
      .where(prospective_category: { name: 'Other' })
  }
end
