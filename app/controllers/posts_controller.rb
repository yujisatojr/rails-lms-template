class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_course
  before_action :load_post, except: [:index, :new, :create]
  
  def index
    @posts = @course.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new post_params
    @post.user_name = current_user.username
    @post.user = current_user
    if @course.posts << @post
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
    if @post.update post_params
      redirect_to @course
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to @course
  end
  
  private
  
  def load_course
    @course = Course.find params[:course_id]
  end
  
  def load_post
    if current_user.role == "admin"
      @post = @course.posts.find params[:id]
    else
      @post = current_user.posts.find params[:id]
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :rating)
  end
end
