class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  
  def index
    @chapters = @course.chapters
  end
  
  def new
    @chapter = Chapter.new
  end
  
  def create
    @chapter = Chapter.new chapter_params
    if @course.chapters << @chapter
      redirect_to @course
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @chapter.update chapter_params
      redirect_to [@course, @chapter]
    else
      render :edit
    end
  end
  
  def destroy
    @chapter.destroy
    redirect_to @course
  end
  
  private
  
  def load_course
    @course = Course.find params[:course_id]
  end
  
  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title,:course_id,:length,:body)
  end
end