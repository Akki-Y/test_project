class PostsController < ApplicationController

  before_action :set_post, only: %w[edit destroy update]

  def index
    @posts = Post.all
    # Select * from posts;
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do|format|
      if @post.save
        # PostMailer.new_post_live(@post).deliver!
        format.html{redirect_to posts_url(@post), notice: "Post was successfully created."}
      else
        format.html{render :new, status: :unprocessable_entity}
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    end
  end

  def destroy 
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post_title, :post_description)
  end
end
