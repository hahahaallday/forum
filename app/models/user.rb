class User < ApplicationRecord
	has_many :questions , ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC") }
	has_many :answers , ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC") }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
