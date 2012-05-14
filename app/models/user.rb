class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable, :recoverable, :trackable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # VALIDATIONS
  validates :fullname, :presence => true
  validates :username, :presence => true

  # FUNCTION TO FIND A USER THROUGH HIS EMAIL ADDRESS, AND COMPARE THE PASSWORD SENT
  def self.find_user(params={})
    user = self.where{username == params[:username]}.first
    if !user.blank?
      return user if user.valid_password?(params[:password])
    end
  end

end
# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  email               :string(255)     default(""), not null
#  encrypted_password  :string(255)     default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer(4)      default(0)
#  fullname            :string(255)     not null
#  username            :string(255)     not null
#  is_admin            :boolean(1)      default(FALSE)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

