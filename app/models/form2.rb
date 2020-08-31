class Form2 < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
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
