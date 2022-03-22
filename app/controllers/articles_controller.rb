class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "1234", except: [:index, :show]
  # before_action load controller - dont repeat yourself
  # private tworze i wykorzystujesz go

  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def upload
    uploaded_file = params[:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
    # https://guides.rubyonrails.org/form_helpers.html#uploading-files
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end
    
  def update
    # @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :title_description, :body, :picture, :submits_time, :status)
    end

    def load_article
      @article = Article.find(params[:id])
    end
end
