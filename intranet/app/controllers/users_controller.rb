class UsersController < ApplicationController
	

	def index
		@users = User.all
	end

	def showByRole
		@users = User.where(role: 0)
	end

	def show
		@users = User.find(params[:id])
	end

	def newusers
		@user = User.where(role: 0)
	end

	def viewgroups
		@course = Course.find(params[:id])
	end
	
	def viewregisteredcourses
		@user = User.find(current_user.id)
		@user = @user.groups

	end
	def showdepartment
		@department = Department.all
	end
	def showdep
		@department = Department.find(params[:id])
		@user = User.where(role: 1, department: @department.name)
	end
	def newdepartment
		@department = Department.new
		
	end
	def createdepartment
		@department = Department.new(department_params)
		@department.save
		redirect_to :showdepartment
	end
	def editdepartment
		@department = Department.find(params[:id])
	end
	def destroydepartment
		@department = Department.find(params[:id])
		@department.destroy
		redirect_to :showdepartment	
	end
	def updatedepartment
		@department = Department.find(params[:id])

		@department.update(department_params)
		redirect_to :showdepartment

	end
	def shownews
		@news = Post.all
	end
	def addnews
		@news = Post.new
		
	end
	def createnews
		@news = Post.new(news_params)
		@news.save
		redirect_to :show_news
	end

	def coursereg

		@group = Group.find(params[:id2])

		if @group.users.size < @group.tscope
			
			@user = User.find(current_user.id)
			@user.groups << @group
			@group.update(cscope: @group.users.size)

			redirect_to :back, notice: "Registered"
		else
			redirect_to :back, notice: "Not Registered"

		end

	end

	def courseUnreg
		@group = Group.find(params[:id2])
	end

	def editnews
		@news = Post.find(params[:id])
	end
	def delnews
		@news = Post.find(params[:id])
		@news.destroy
		redirect_to :show_news
	end
	def updatenews
		@news = Post.find(params[:id])
		@news.update(news_params)
		redirect_to :show_news

	end

	def remove
		@user = User.find(params[:id])
		
		if @user.id != current_user.id
			@user.destroy
			redirect_to :back, notice: "ok"
		else
			redirect_to :back, notice: "you can NOT delete yourself"
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(update_params)
		if @user.save!
			redirect_to users_path, notice: "All good"
		else
			redirect_to :back, notice: "Something went wrong!"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	protected
	
		def update_params
			params.require(:user).permit(:name, :surname, :age, :role, :faculty, :department, :specialization)
		end
		def news_params
			params.require(:post).permit(:title, :text)
			
		end
		def department_params
			params.require(:department).permit(:name)
		end


end