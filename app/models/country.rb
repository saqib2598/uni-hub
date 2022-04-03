class Country < ApplicationRecord
  has_many :universities, dependent: :destroy

  validates :name, presence: true
end
