class Company < ApplicationRecord
    has_many :jobs
    scope :alpha, -> { order(:name) }
end
