class Users::GamesController < ApplicationController
    def index
        @game = Game.all
    end
    
    def show
        @game = Game.find(params[:id])
    end
    
    def edit
        @game = Game.find(params[:id])
    end
    
    
    def update
        @game = Game.find(params[:id])
        @game.update(game_params)
        flash[:notice] = "保存しました！"
        redirect_to game_path(@game)
    end
    
    private

    def game_params
        params.require(:game).permit(:title, :body, :tag, :image)
    end
end
