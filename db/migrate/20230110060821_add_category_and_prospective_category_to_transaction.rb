class AddCategoryAndProspectiveCategoryToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :category, foreign_key: true
    add_reference :transactions, :prospective_category, foreign_key: { to_table: :categories }
  end
end
