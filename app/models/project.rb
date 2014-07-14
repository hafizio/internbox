class Project < ActiveRecord::Base
  belongs_to :intern, class_name: 'User'

  MENTOR_ROLE = ['Code Reviewer', 'Pair Programmer', 'Client']
end
