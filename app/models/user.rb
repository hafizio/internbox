class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy
  belongs_to :mentor, class_name: 'Admin', foreign_key: 'mentor_id'
end
