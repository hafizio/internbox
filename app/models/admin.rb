class Admin < ActiveRecord::Base
  AVAILABILITY = [true, false]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :interns, class_name: 'User'
end
