class BlogsController < ApplicationController
  before_filter :authorize_or_redirect!, except: [:index, :show]

  # GET /blogs
  def index
    @blogs = Blog.page(params[:page]).per(5)
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
    @blog.title = params[:blog][:title]
    @blog.content = params[:blog][:content]
    #@blog.date = params[:blog][:date]
    if @blog.save
      redirect_to @blog, message: "Blog successfully updated!"
    else
      render action: 'new', message: "Problem updating blog..."
    end
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
