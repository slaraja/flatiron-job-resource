class Job < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :company
  belongs_to :user
end
