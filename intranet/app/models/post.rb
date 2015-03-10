class Post
  include Mongoid::Document
  include Mongoid::Timestamps

	belongs_to :user
	field :title, type: String
	field :text, type: String

  validates :title, presence: true
            # :length => { :minimum => 5 }
  validates :text, presence: true
            # :length => { :minimum => 5 }

	
end