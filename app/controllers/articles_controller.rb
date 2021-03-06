class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :destroy , :update , :show]

def new
	@article = Article.new
end


def create
	@article = Article.new(article_params)
	if @article.save
		flash[:success] = "article was successfully created"
	redirect_to article_path(@article)
else
	render 'new'
	end
end

def edit

end

def show 

end


def index
	@articles = Article.all
end




def destroy
	
	@article.destroy
	flash[:danger] = 'article was successfully destroyed'
	redirect_to articles_path
end



def update
	

	if @article.update(article_params)
		flash[:success] = "article was successfully updated"
		redirect_to article_path(@article)
	else
		render 'edit'
	end

end

	def set_article
		@article = Article.find(params[:id])
	end
 
	def article_params
		params.require(:article).permit(:title, :description)
	end

end
