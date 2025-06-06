class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validate :checkin_date_before_checkout_date

  scope :upcoming_reservations, -> { where("checkin_date >= ?", Date.today).order(checkin_date: :asc) }
  scope :current_reservations, -> { where("checkin_date <= ? AND checkout_date >= ?", Date.today, Date.today).order(checkin_date: :asc) }

  private

  def checkin_date_before_checkout_date
    if checkin_date >= checkout_date
      errors.add(:checkin_date, "must be before checkout date")
    end
  end
end
