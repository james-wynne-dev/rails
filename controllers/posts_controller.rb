require 'date'

class PostInfo
  @@today = Date.today
  attr_reader(:content, :user, :tags, :age, :date_string, :title)
  def initialize(post)
    @title = post.title
    @content = post.content
    @user = post.user.username
    @tags = post.tags
    @age = @@today.mjd - post.created_at.to_date.mjd
    @date_string = post.created_at.strftime("%d %b %y")
  end
end

class PostsController < ApplicationController
  def index
    posts = Post.all
    posts = posts.collect { |post| PostInfo.new(post) }
    posts = posts.group_by { |post| post.age }
    keys = posts.keys.sort
    @posts_by_day = keys.collect { |key| posts[key] }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  private
  def message_params
    params.require(:post).permit(:content)
  end

  def show
    # @posts = Post.find(params[:id])
  end
end
