# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Property.create!([
  {
    name: "서울의 부티크 호텔",
    headline: "서울의 부티크 호텔",
    description: "서울의 부티크 호텔",
    address: "서울시 종로구 종로 100",
    address_detail: "서울시 종로구 종로 100",
    city: "서울",
    state: "서울",
    country: "한국"
  },
  {
    name: "인천의 부티크 호텔",
    headline: "인천의 부티크 호텔",
    description: "인천의 부티크 호텔",
    address: "인천시 중구 인천 100",
    address_detail: "인천시 중구 인천 100",
    city: "인천",
    state: "인천",
    country: "한국"
  },
])