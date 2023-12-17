class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  after_create :send_confirmation_instructions
  validates :name, presence: true
  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
end
