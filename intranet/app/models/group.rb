class Group 
  include Mongoid::Document
  include Mongoid::Timestamps

	belongs_to :course
	field :name, type: String
	field :day, type: String
	field :cscope, type: Integer, default: 0
	field :tscope, type: Integer, default: 20

	# filed :teacher_id, type: String, default: ""


	has_and_belongs_to_many :users

end
# "Select * from users where user.group == 123"

# a = User.find(id)
# a.groups

# User1.groups // [group1, 2, 3, 4]
# Group1.users // [user1, 2, 3, 4]
	# field :student_ids, type: Array, default: []
