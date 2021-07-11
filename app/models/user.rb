class User < ApplicationRecord
    has_many :comments
    has_many :commented_jobs, through: :comments, source: :job   
    #"job" above matches belongs_to :job in comments model
    has_many :jobs #that are created by user

    validates :username, uniqueness: true,  presence: true
    validates :email, presence: true

    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |user|
        user.username = response[:info][:name]
        user.email = response[:info][:email]
        user.password = SecureRandom.hex(15)
        end
    end

end