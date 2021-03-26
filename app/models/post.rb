class Post < ApplicationRecord
  belongs_to :user

  NIHONGO = ["Não é necessário", "10% ~ 30% (Básico)", "31% ~ 60% (Intermediário)", "61% ~ 100% (Avançado)"]

  PREFECTURE = ["Hokkaido", "Aomori", "Iwate", "Miyagi", "Akita", "Yamagata", "Fukushima",
    "Ibaraki", "Tochigi", "Gunma", "Saitama", "Chiba", "Tokyo", "Kanagawa", "Niigata",
    "Toyama", "Ishikawa", "Fukui", "Yamanashi", "Nagano", "Gifu", "Shizuoka", "Aichi", "Mie",
    "Shiga", "Quioto", "Osaka", "Hyogo", "Nara", "Wakayama", "Tottori", "Shimane", "Okayama",
    "Hiroshima", "Yamaguchi", "Tokushima", "Kagawa", "Ehime", "Kochi", "Fukuoka", "Saga",
    "Nagasaki", "Kumamoto", "Oita", "Miyazaki", "Kagoshima", "Okinawa"]

  LEITURA = ["Não é necessário", "10% ~ 30% (Básico)", "31% ~ 60% (Intermediário)", "61% ~ 100% (Avançado)"]

  validates :title, :service, :turn, :description, :prefecture, :address,
  :value, :company, :contact, :phone, presence: true
  end
