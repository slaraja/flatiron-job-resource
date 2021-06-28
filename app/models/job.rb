class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :company, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :title, presence: true

end
