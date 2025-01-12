class Users::CommentsController < ApplicationController
    def index
        @comment = Comment.all
    end
    
    def show
        @comment = Comment.find(params[:id])
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.customer_id = current_customer.id
        if @comment.save
            redirect_to users_comment_path(@comment.id), notice: 'コメントを作成しました！'
        else
            render :new, alert: 'コメントに失敗しました'
        end
    end
    
    def destroy
        @strategy = @comment.strategy
        @comment = Comment.find(params[:id])
        @comment = Comment.destroy
        redirect_to users_strategy_path(@strategy.id)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
