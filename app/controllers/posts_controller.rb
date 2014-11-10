class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, except: [:index, :show]

  respond_to :html

  def index
    @posts = Post.all.order("created_at DESC")
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = current_usuario.posts.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_usuario.posts.build(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:titulo, :contenido)
    end
end
