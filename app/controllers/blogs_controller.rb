class BlogsController < ApplicationController
  def index
  end
end
class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy] # DRYにてアクションの前に設置

  def index
    @blogs = Blog.all #
  end

  def new
    @blog = Blog.new
#    binding.pry
  end

  def create
#    Blog.create(blog_params) # ストロングパラメーターのメソッドを定義したので使用した
#    Blog.create(params[:blog]) #インスタンス関数を使って全ての情報を取得している、但しセキュリティに難あり。
#    Blog.create(title: params[:blog][:title], content: params[:blog][:content]) #ハッシュを使わないでカラムを一つずつ取得している
#    redirect_to new_blog_path
    @blog = Blog.new(blog_params) #バリデーションの機能追加
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "つぶやきました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
    
  # 定義する 一覧表示の詳細リンクを作成した際に作成した
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
    
  def update #アップデート対象となるidをfindで取得し、その後createと同様にupdate出来たらの分岐を作成
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"つぶやきを削除しました！"
  end
  
    private #噂のストロングパラメーター。設定しないと無関係のカラムを編集出来るので設定する。

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  # idをキーとして値を取得するメソッド(DRY（Don’t Repeat Yourself）)shou edit update　で
  # @blog = Blog.find(params[:id]) をメソッド定義しているメソッド。
  # また、ルーティングで呼ばれる訳ではないので、ストロングパラメータに設置
  def set_blog
      @blog = Blog.find(params[:id])
  end

end
