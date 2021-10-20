class Task < ApplicationRecord
  belongs_to :user
  has_many :pomodoros, dependent: :nullify
end
