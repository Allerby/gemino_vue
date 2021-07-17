class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, google_display_name:, google_id:, social_photo_url:)
    create_with(
      google_id: google_id,
      google_display_name: google_display_name,
      social_photo_url: social_photo_url
    ).find_or_create_by!(
      email: email,
    ) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
