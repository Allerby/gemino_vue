# frozen_string_literal: true

# Controller to take CSV uploads and create Transactions from them
class UploadCsvController < ApplicationController
  require 'csv'

  before_action :authenticate_user!

  def index
    @uploads = CsvUpload.where(
      user: current_user
    )
  end

  def upload
    csv = CsvUpload.create(
      bank: params['bank'],
      user_id: params['user_id'],
      filename: params[:file].original_filename,
      user: current_user
    )
    create_transaction_records(csv) # would be good to do this in worker so doesn't hold up rendering

    render json: csv
  end

  def destroy
    csv = CsvUpload.find(params[:csv_id])
    csv.destroy

    render json: csv
  end

  private

  def create_transaction_records(csv)
    transactions = []
    places_service = GooglePlacesService.new

    CSV.foreach(params['file'].tempfile, headers: true).each do |row|
      transaction = Transaction.new(
        amount: row['Amount'],
        date: row['Date'],
        particulars: row['Particulars'],
        reference: row['Reference'],
        details: row['Details'],
        code: row['Code'],
        transaction_type: row['Type'],
        user: current_user,
        csv_upload_id: csv.id
      )
      places_service.call(transaction)
      transaction.save
    end

    # just doing this for now as we're not categorising yet
    Transaction.transaction do
      transactions.map(&:save)
    end

    # group_transactions(transactions)
  end

  def upload_params
    params.permit(:bank, :file)
  end

  def group_transactions(transactions)
    # group transactions
    groups = transactions.group_by { |t| [t.details, t.particulars] }
    # loop over group
    groups.each do |_group_field_array, group_transaction_array|
      # find the category for first transaction in group
      suggested_category = group_transaction_array.first.categorise
      # apply the category to the group
      group_transaction_array.each do |transaction|
        transaction.prospective_category_id = Category.find_by(name: suggested_category.category).id
        transaction.save
      end
    end
  end
end
