class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticket, :company_name, :identification_document, :value, :category
end
