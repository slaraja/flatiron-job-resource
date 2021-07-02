class Company < ApplicationRecord
    has_many :jobs

    validates :name, uniqueness: true

    scope :alpha, -> { order(:name) }
    
end
