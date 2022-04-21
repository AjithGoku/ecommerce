
  class User < ApplicationRecord

    has_many :order
  
    # Include default devise modules. Others available are:
  
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
    devise :database_authenticatable, :registerable,
  
           :recoverable, :rememberable, :validatable
  
  
  
      validates :first_name, presence: true
  
      validates :last_name, presence: true
  
      validates :email, presence: true
  
      #validates :password, presence: true, length: { minimum: 6 }
  
      #validates :password_confirmation, presence: true, length: { minimum: 6 }
  
      validates :gender, presence: true
  
      validates :phone_number, presence: true, length: { minimum: 10 }
  
      validates :birthday, presence: true
  
      validates :profile_picture_url, presence: true
  
      validates :address, presence: true, length: { minimum: 10 }
  
      validates :about, presence: true, length: { minimum: 1 }
  
  end
  

