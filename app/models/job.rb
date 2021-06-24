class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :company

  # validates :link, presence: true

end
