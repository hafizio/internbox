class Project < ActiveRecord::Base
  belongs_to :intern, class_name: 'User', foreign_key: 'user_id'

  MENTOR_ROLE = ['Code Reviewer', 'Pair Programmer', 'Client']
end
