class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_params)
    @group.user = @user

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:id])
    current_user.join!(@group) if !current_user.is_member_of?(@group)
    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])
    current_user.quit!(@group) if current_user.is_member_of?(@group)
    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
