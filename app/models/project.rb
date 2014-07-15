class Project < ActiveRecord::Base
  MENTOR_ROLE = ['Code Reviewer', 'Pair Programmer', 'Client']
  PROJECT_LEVEL = ['Beginner', 'Intermediate', 'Advanced']

  belongs_to :intern, class_name: 'User', foreign_key: 'user_id'
  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(names)
    self.tags = names.split(',').map do |t|
      Tag.where(name: t.downcase.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).projects
  end
end
