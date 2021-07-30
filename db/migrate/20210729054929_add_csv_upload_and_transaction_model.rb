class AddCsvUploadAndTransactionModel < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :particulars
      t.string :reference
      t.string :details
      t.string :code
      t.date :date
      t.string :transaction_type
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :csv_uploads do |t|
      t.string :bank
      t.string :filename
      t.references :transactions
      t.references :user, foreign_key: true
      t.timestamps
    end

    add_reference :transactions, :csv_upload, foreign_key: true
  end
end
