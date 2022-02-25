class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :email, presence: true
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
