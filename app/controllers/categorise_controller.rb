class CategoriseController < ApplicationController
  def index
    transactions_for_user = current_user.transactions.joins(:prospective_category)

    grouped_transactions = transactions_for_user.group_by do |transaction|
      transaction.prospective_category.name
    end

    @categories_with_spending = grouped_transactions.map do |category, transactions|
      { category: category.split(' ').join('_'), sum: transactions.map(&:amount).sum }
    end

    @categories_with_spending.sort_by! { |k| -k[:sum] }
  end
end
