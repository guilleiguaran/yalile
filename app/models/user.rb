# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  status              :integer          default(0), not null
#  fullname            :string(255)      not null
#  username            :string(255)      not null
#  is_admin            :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class User < ActiveRecord::Base

  paginates_per 10

  has_many :sales
  has_many :sale_transactions, through: :sales

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable, :recoverable, :trackable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :is_admin, :username, :status

  # VALIDATIONS
  validates :fullname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # FUNCTION TO FIND A USER THROUGH HIS USERNAME, AND COMPARE THE PASSWORD SENT
  def self.find_user(params={})
    user = find_by_username(params[:username])
    return user if !user.blank? && user.valid_password?(params[:password])
    nil
  end

  def valid_status
    return ["new", 0], ["approved", 1], ["inactive", 2]
  end

end
