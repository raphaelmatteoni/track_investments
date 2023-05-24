class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :ticket
      t.string :company_name
      t.string :identification_document
      t.decimal :value
      t.string :category

      t.timestamps
    end
  end
end
