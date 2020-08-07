class Form1 < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { maximum: 50 }
    validates :time_work, presence: true, length: { maximum: 50 }
    validates :job, presence: true, length: { maximum: 50 }
end
