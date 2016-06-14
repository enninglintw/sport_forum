class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :member_required, only: [:new, :create ]

  def show
    @post = Post.find(params[:id])
    @group = @post.group
  end

  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @group = @post.group
  end

  def update
    @post = Post.find(params[:id])
    @group = @post.group

    if @post.update(post_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def member_required
    @group = Group.find(params[:group_id])
    return if current_user.is_member_of?(@group)

    redirect_to group_path(@group)
  end

end
