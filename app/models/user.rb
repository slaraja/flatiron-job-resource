class User < ApplicationRecord
    has_many :comments
    has_many :commented_jobs, through: :comments, source: :job   
    #"job" above matches belongs_to :job in comments model
    has_many :jobs #that are created by user

    validates :username, uniqueness: true,  presence: true
    validates :email, presence: true
    #do not need to validate password b/c it's included in secure password

    has_secure_password
    #gives .authenticate method 
    #validates password true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider])
        u.username = response[:info][:name]
        u.email = response[:info][:email]
        u.password = SecureRandom.hex(15)
        
    end

end
