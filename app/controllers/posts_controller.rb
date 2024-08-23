class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    # DBから全てのPostを取得
    @posts = Post.all
  end

  def new
    # 新しいPostを作成
    @post = Post.new
  end

  def create
    # フォームから送られたデータを使って新しいPostを作成
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    # フォームから送られたデータを使ってPostを更新
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    # Postを削除
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    # params[:post]の中から:titleと:contentだけを許可
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
