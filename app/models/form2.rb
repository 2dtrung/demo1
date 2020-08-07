class Form2 < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
end
