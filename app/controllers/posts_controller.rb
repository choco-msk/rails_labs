class PostsController < ApplicationController
  before_action :current_user, only: %i[create]
  def new

  end

  def show
    @post = Post.find(params[:id])
  end

  def index

  end

  def create
    @post = Post.new(params_post)
    @post.author_id = @_current_user.id
    @post.save()
    redirect_to @post
  end

  private def params_post
    params.require(:post).permit(:title, :body)
  end

end
