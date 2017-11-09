require 'money'

class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true
  validates :cost, numericality: {greater_than: 0}, if: :chargeable?


  def chargeable?
    chargeable == true
  end

  def time_format
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def time_format_days
    created_at.strftime("%d/%m/%y")
  end

  def money_format
    Money.new(cost,"AUD").format
  end

  def currency_conversion(user)
    own_currency_code = user.profile.nationality_code.currency
    own_currency_symbol = user.profile.nationality_code.currency.code

    acceptable_currency =[
      "AUD",
      "BGN",
      "BRL",
      "CAD",
      "CHF",
      "CNY",
      "CZK",
      "DKK",
      "GBP",
      "HKD",
      "HRK",
      "HUF",
      "IDR",
      "ILS",
      "INR",
      "JPY",
      "KRW",
      "MXN",
      "MYR",
      "NOK",
      "NZD",
      "PHP",
      "PLN",
      "RON",
      "RUB",
      "SEK",
      "SGD",
      "THB",
      "TRY",
      "USD",
      "ZAR",
      "EUR"
    ]

    if !acceptable_currency.include?(own_currency_code)
      return "Sorry This app can not handle #{own_currency_code}"
    end

    response = HTTParty.get('http://api.fixer.io/latest?base=AUD')
    currency_amount = (response["rates"]["#{own_currency_code}"] * cost/100).round(2)
    "#{own_currency_symbol} #{currency_amount}"
  end

end
