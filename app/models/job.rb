class Job < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :company

end
