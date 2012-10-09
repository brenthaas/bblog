class BlogsController < ApplicationController
  before_filter :authorize_or_redirect!, except: [:index, :show]

  # GET /blogs
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit 
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = @current_user.id
    if @blog.save
      redirect_to @blog, message: "Blog successfully saved!"
    else
      render action: 'new', message: "Problem saving blog..."
    end
  end

  # PUT /blogs/1
  def update
    @blog = Blog.find(params[:id])
  end

  # DELETE /blogs/1
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path, message: "Successfully destroyed \"#{@blog.title[0,10]}...\""
    else
      redirect_to blogs_path, error: "Could not destroy BlogID #{params[:id]}"
    end
  end
end
