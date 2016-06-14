class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @group = @post.group
  end

end
