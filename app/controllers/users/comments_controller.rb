class Users::CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end
    
    def new
      @comment = Comment.new
    end
    
    def show
        @comment = Comment.find(params[:id])
    end
    
    def create
        @strategy = Strategy.find(params[:strategy_id])
        @comment = @strategy.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to strategy_path(@strategy.id), notice: 'コメントを作成しました！'
        else
           flash.now[:alert] = 'コメントに失敗しました'
           render :new
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @strategy = @comment.strategy
        @comment.destroy
        redirect_to strategy_path(@strategy.id)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comment, :user_id, :game_id)
    end
end
