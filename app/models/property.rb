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

    has_many_attached :images

    has_many :reviews, dependent: :destroy

    has_many :wishlists, dependent: :destroy
    has_many :wishlisted_users, through: :wishlists, source: :user

    has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :user, dependent: :destroy

    def wishlisted_by_user?(user)
        if user.nil?
            return false
        end

        wishlists.exists?(user_id: user.id)
    end

    def available_dates
        next_reservation  = reservations.upcoming_reservations.first
        current_reservations = reservations.current_reservations.first

        if current_reservations.nil? && next_reservation.nil?
            Date.tomorrow..Date.today + 30.days
        elsif current_reservations.nil?
            Date.tomorrow..next_reservation.checkin_date - 1.day
        elsif next_reservation.nil?
            current_reservations.checkout_date..Date.today + 30.days
        else
            current_reservations.checkout_date..next_reservation.checkin_date - 1.day
        end
    end
end
