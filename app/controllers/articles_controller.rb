class ArticlesController < ApplicationController

    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        article_id = params[:id]
        @article = Article.find(article_id)
        @comment = Comment.new
        @comment.article_id = article_id
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        flash.notice = "Article '#{@article.title}' created"

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])

        if @article
            @article.destroy
            flash.notice = "Article '#{@article.title}' deleted"
        end

        redirect_to action: :index
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated"
      
        redirect_to article_path(@article)
    end
end