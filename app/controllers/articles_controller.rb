class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :get_user
  
 def new
  @article = Article.new
 end

 def create
  @article = Article.new(article_params)
  if @article.save
   flash[:notice] = "Artigo criado com sucesso"
   redirect_to article_path(@article)
  else
   render 'new'
  end
 end

 def show
 end

 def edit
  if current_user == @article.user
  else
    render 'show'
  end
 end

 def update
  if @article.update(article_params)
   flash[:notice] = "O artigo foi atualizado"
   redirect_to article_path(@article)
  else
   render 'edit'
  end
end

def index
  @articles = Article.includes(:user).order(created_at: :desc).page(params[:page])
end

def myarticles
  @myarticles = Article.where(user_id: @usuario).order(created_at: :desc).page(params[:page])
end

def userarticles
  @userarticles = Article.where(user_id: params[:user_id]).page(params[:page])
  @emailarticles = params[:email]
  @namearticles = params[:name]
end

def destroy
  @article.destroy
  flash[:notice] = "O artigo foi deletado"
  redirect_to articles_path
 end

private
  def article_params
   params.require(:article).permit(:title, :description, :user_id, :anexo)
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def get_user
    @usuario = current_user.id
  end 



end