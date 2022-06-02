class Order < ApplicationRecord
enum method_of_payment: { credit_card: 0, transfer: 1 }
enum order_status: { waiting_for_deposit: 0, payment_confirmation: 1, production: 2, ready_to_ship: 3, sent: 4 }
 belongs_to :customer
 has_many :order_details
 
attribute :shipping_cost, :integer, default: 800
end
