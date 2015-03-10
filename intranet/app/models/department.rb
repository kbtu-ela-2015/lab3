class Department
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :teacher, type: Array, default: []

  validates :name, presence: true
            # :length => { :minimum => 5 }

  has_and_belongs_to_many :users

  def teachers
  	teacher.map{ |i| User.find(i) }
  end

end