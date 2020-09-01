class Form2 < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :company_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [200, 200])
  end

  def self.as_csv
    CSV.generate("\uFEFF") do |csv|
      columns = %w(company_name tax_code address name position date work_des income)
      csv << columns.map(&:humanize)
      all.each do |form2|
        csv << form2.attributes.values_at(*columns)
      end
    end
  end
end
