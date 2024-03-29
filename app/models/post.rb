class Post < ApplicationRecord
  belongs_to :user
  acts_as_punchable

  NIHONGO = ["Não é necessário", "10% ~ 30% (Básico)", "31% ~ 60% (Intermediário)", "61% ~ 100% (Avançado)"]

  PREFECTURE = ["Hokkaido", "Aomori", "Iwate", "Miyagi", "Akita", "Yamagata", "Fukushima",
    "Ibaraki", "Tochigi", "Gunma", "Saitama", "Chiba", "Tokyo", "Kanagawa", "Niigata",
    "Toyama", "Ishikawa", "Fukui", "Yamanashi", "Nagano", "Gifu", "Shizuoka", "Aichi", "Mie",
    "Shiga", "Quioto", "Osaka", "Hyogo", "Nara", "Wakayama", "Tottori", "Shimane", "Okayama",
    "Hiroshima", "Yamaguchi", "Tokushima", "Kagawa", "Ehime", "Kochi", "Fukuoka", "Saga",
    "Nagasaki", "Kumamoto", "Oita", "Miyazaki", "Kagoshima", "Okinawa"]

    LEITURA = ["Não é necessário", "10% ~ 30% (Básico)", "31% ~ 60% (Intermediário)", "61% ~ 100% (Avançado)"]

   include PgSearch::Model
  pg_search_scope :search_info,
    against: [ :title, :service,:company,:contact,:salary,:prefecture,:address,:description,:value ],

   #if you want to search more table
    # associated_against: {
    #   user: [:name, :address],
    #   tags: [:name]
    # },

    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }



  # validates :title, :service, :turn, :description, :prefecture, :address,
  # :value, :company, :contact, :phone, presence: true
end
