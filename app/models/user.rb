class User < ApplicationRecord
    has_many :comments
    has_many :jobs, through: :comments
    has_many :jobs #that are created by user
end
