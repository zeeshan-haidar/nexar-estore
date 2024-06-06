# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin_role             :boolean          default(FALSE), not null
#  city                   :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  country                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  gender                 :enum             default("male"), not null
#  image                  :text
#  last_name              :string           default(""), not null
#  mobile                 :string           default(""), not null
#  name                   :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  street                 :string
#  uid                    :string
#  unconfirmed_email      :string
#  user_role              :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE

#--------------------------
# Field's descryption:
# ------------------------
# uid : It stores a unique identifier associated with the user's account from the OAuth provider
# (in this case, Google). Each user has a distinct uid assigned by the provider,
# which allows your application to uniquely identify them.
#
# provider: It indicates the name of the OAuth provider being used for authentication (e.g., "google_oauth2", "facebook").
# This field helps differentiate between different authentication methods and allows
# your application to handle multiple authentication providers if needed.

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    "#{street}, #{city}, #{country}"
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      user.email ||= data["email"] if data == session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
      user.save(validate: false)
    end
  end
end
