class Task < ApplicationRecord
  belongs_to :user
  has_many :pomodoros, dependent: :nullify
  validates :title, presence: true
  validates :body, length: { maximum: 200 }
end
