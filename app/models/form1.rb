require "csv"

class Form1 < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 50 }
  validates :time_work, presence: true, length: { maximum: 50 }
  validates :job, presence: true, length: { maximum: 50 }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [200, 200])
  end

  def self.as_csv
    CSV.generate("\uFEFF") do |csv|
      columns = %w(name time_work job date customer income work_des)
      csv << columns.map(&:humanize)
      all.each do |form1|
        csv << form1.attributes.values_at(*columns)
      end
    end
  end
end
