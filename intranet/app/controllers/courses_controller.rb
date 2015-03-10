class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
    
  end

  def showByTeacher
    @courses = Course.where(description: current_user.name)
  end

  def show
    @course = Course.find(params[:id])
  end
  
  def listcourses
    @courses = Course.all
  end

  def showusers
    @group = Group.find(params[:id])
    @group = @group.users
  end
  
  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def addgroup
    @course = Course.find(params[:id]) 
  end

  def groupremove
    @course = Course.find(params[:id1])
    @group = @course.groups.find(params[:id2])
    @group.destroy
    redirect_to :back
  end

  def editgroup
    @course = Course.find(params[:id1])
    @group = @course.groups.find(params[:id2])
    @teacher = User.where(role: 1)

  end
  
  def updategroup
    @course = Course.find(params[:id1])
    @group = @course.groups.find(params[:id2])
    @group.update(group_params)
    redirect_to :back   
  end

  def creategroup
    @course = Course.find(params[:id])
    @group = @course.groups.new(group_params)

    if @group.save!
      redirect_to :back, notice: "All good"
    else
      redirect_to :back, notice: "Something went wrong!"
    end

  end

  def create
    @course = Course.new(course_params)
    @course.save

    redirect_to :courses
  end

  def update
      @course = Course.find(params[:id])
      @course.update(course_params)
      redirect_to :courses
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to :courses
  end

  private
    def group_params
      params.require(:group).permit(:day,:name,:tscope)
      
    end
    def course_params
      params.require(:course).permit(:title, :description)
    end
end
