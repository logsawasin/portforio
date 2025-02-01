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
        @strategy = Strategy.find_by(id: params[:strategy_id])
      
        unless @strategy
          flash[:alert] = "対象の攻略情報が見つかりません。"
          redirect_to root_path and return
        end
      
        @comment = @strategy.comments.build(comment_params)
        @comment.user = current_user
      
        if @comment.save
          redirect_to strategy_path(@strategy.id), notice: 'コメントを作成しました！'
        else
          @game=@strategy.game
          @comments = @strategy.comments.order(created_at: :desc).page(params[:page]).per(10)
          flash.now[:alert] = 'コメントの投稿に失敗しました。'
          render "users/strategies/show"
        end
      end


    
    def destroy
        @comment = Comment.find(params[:id])
        @strategy = @comment.strategy
        @comment.destroy
        redirect_to strategy_path(@strategy.id)
    end
    
    private
    
    private

    def set_strategy
      @strategy = Strategy.find_by(id: params[:strategy_id])
      if @strategy
        @game = @strategy.game  # @strategy から @game を取得
      else
        flash[:alert] = "攻略情報が見つかりません。"
        redirect_to root_path
      end
    end

    
    def comment_params
        params.require(:comment).permit(:comment, :user_id, :game_id)
    end
end
