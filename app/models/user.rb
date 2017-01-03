class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,:recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook,:github,:google_oauth2]
         
  has_many :posts, dependent: :destroy
  validates_uniqueness_of :username
  
  def self.from_omniauth(auth)
    p auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.picture # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
