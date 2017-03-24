class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]
  has_many(:apartments)
  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }, default_url: "http://placehold.it/150x175"
validates_attachment :avatar,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.uid + "@twitter.com"
        user.password = Devise.friendly_token[0,20]
        user.username = auth.info.nickname
      end
    end
end
