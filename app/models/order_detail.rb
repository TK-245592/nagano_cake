class OrderDetail < ApplicationRecord
  enum production_status: { cannot_be_manufactured: 0, waiting_for_production: 1, production: 2, completion: 3 }
  belongs_to :order
  belongs_to :item
end
