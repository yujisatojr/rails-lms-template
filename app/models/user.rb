class User < ApplicationRecord
  #has_secure_password
  has_many :posts
  has_many :articles
  has_many :comments

  def password_required?
    super && provider.blank?  # If there is a value in the provider attribute, password input is exempt.
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
          user_name = auth.info.nickname
      
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              email: auth.info.email,
              username: user_name,
              password: Devise.friendly_token[0, 20]
            )
            #user.skip_confirmation!
            user.save!
          end
      
          user
        end

  USER_NAME_REGEX = /\A(?=.{3,28}\z)[a-zA-Z0-9]+(?:[._][a-zA-Z0-9]+)*\z/
  #/\A(?=.*[a-z])[a-z\d]+\Z/i

  validates :username, presence: { message: "Please type" }, format: {with: USER_NAME_REGEX, message: "Please enter only alphanumeric characters"}, uniqueness: true
  validates :email, format: {with: /\A\S+@\S+\.\S+\z/, message: "Please enter in the format (including @)"}, uniqueness: true

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
    validates :password,
      format: { with: VALID_PASSWORD_REGEX,
      message: "A password has to be 6-12 characters in half-width, including at least one uppercase letter, one lowercase letter, and one number." }, on: :create, if: :password_required?
    validates :password_confirmation, presence: { message: "Please type" }, on: :create, if: :password_required?
         
  enum occupation:{
     "---":0,
     "Administrative": 1, "Marketing": 2, "IT/Communication": 3, "Financial Specialist": 4, "Graphic Designer": 5, "Sales": 6, "Healthcare": 7, "Teacher": 8, "Student": 9, "Other": 10
   }
   private

end
