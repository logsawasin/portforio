class Users::StrategiesController < ApplicationController
    def show
        @strategy = Strategy.find(params[:id])
        @game = @strategy.game
        @comment = @strategy.comments.new
    end
    
    def edit
        @strategy = Strategy.find(params[:id])
    end
    
    def new
    @game = Game.find_by(id: params[:game_id])  
    unless @game
      redirect_to root_path, alert: "ゲームが見つかりません"
      return
    end
    @strategy = Strategy.new(game_id: @game.id)
    end

        
    
 def create
  @strategy = Strategy.new(strategy_params)
  @strategy.user_id = current_user.id

  if @strategy.save
    redirect_to strategy_path(@strategy.id), notice: 'Strategy was successfully created.'
  else
    puts "💡 保存エラー: #{@strategy.errors.full_messages.join(', ')}" 
    flash.now[:alert] = "作成に失敗しました: #{@strategy.errors.full_messages.join(', ')}"
    render :new
  end
 end

    
    def destroy
        @strategy = Strategy.find(params[:id])
        @strategy.destroy
        redirect_to game_path(@strategy.game_id), notice: "攻略情報を削除"
    end

    
    def update
        @strategy = Strategy.find(params[:id])
        @strategy.update(strategy_params)
        redirect_to strategy_path(@strategy.id)
    end
    
    private
    
    def strategy_params
        params.require(:strategy).permit(:title, :body, :game_id, :image)
    end
end
