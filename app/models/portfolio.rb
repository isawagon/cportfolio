class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coins, dependent: :destroy
  validates :name, presence: true
end
