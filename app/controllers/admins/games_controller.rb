class Admins::GamesController < ApplicationController
    def index
        @game = Game.all
    end
    
    def show
        @game = Game.find(params[:id])
    end
    
    def edit
        @game = Game.find(params[:id])
    end
    
    def new
        @game = Game.new
    end
    
    def create
        @game = Game.new(game_params)
        if @game.save
         redirect_to admins_game_path(@game.id)
        else
            render :new
        end
    end
    
    def update
        @game = Game.find(params[:id])
        @game.update(game_params)
        flash[:notice] = "保存しました！"
        redirect_to admins_game_path(@game.id)
    end
    
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to admins_top_path, notice: "ゲームを削除しました"
    end
    
    private

    def game_params
        params.require(:game).permit(:title, :body, :tag, :image)
    end
    
end
