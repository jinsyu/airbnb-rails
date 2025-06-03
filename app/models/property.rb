class Property < ApplicationRecord
    validates :name, presence: true
    validates :headline, presence: true
    validates :description, presence: true
    validates :address, presence: true
    validates :address_detail, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true

    monetize :price_cents, as: :price
end
