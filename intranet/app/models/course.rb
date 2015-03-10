class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :groups
  # has_many :users
  
  # def user
  #   User.in(id: groups.map(&:user_id))
  # end

  field :title, type: String
  field :description, type: String

  validates :title, presence: true, length:{minimum:6,maximum:10}

end


