class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format:         { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :last_name,  format:         { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :first_name_reading,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角で入力してください' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角で入力してください' }
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'を英数混合で入力してください'
  validates :email, uniqueness: true

  has_many :items
  has_many :orders
end
