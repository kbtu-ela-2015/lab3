class WelcomeController < ApplicationController
	def index
		@users = User.all
		
	end
	def hello
		
	end
	def list
		
	end	
	def guest
	end
end