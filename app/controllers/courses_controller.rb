class CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]
  
  def index
    # Uncomment below if you want to add a search feature
    # if params[:subject]
    #   @courses = Course.where(:subject => params[:subject])
    # elsif params[:difficulty]
    #   @courses = Course.where(:difficulty => params[:difficulty])
    # else
    #  @courses = Course.search(params[:search])
    # end
    @courses = Course.search(params[:search])
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new course_params
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end
  
  def show
    if user_signed_in?
        #do something
    end
    @chapter = Chapter.new
    @post = Post.new
  end
  
  def edit
  end
  
  def update
    if @course.update course_params
      redirect_to @course
    else
      render :edit
    end
  end
  
  def destroy
    @course.destroy
    redirect_to courses_path
  end
  
  #def search
  #  @courses = Course.where("title LIKE ?", "%" + params[:q] + "%")
  #end
  
  private
  
  def load_course
    @course = Course.find params[:id]
  end
  
  def course_params
    params.require(:course).permit(:title,:author,:length,:desc,:author_info,:body,:difficulty)
  end
end