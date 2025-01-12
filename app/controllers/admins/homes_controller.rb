class Admins::HomesController < ApplicationController
     before_action :authenticate_admin!
     
     def top
        @game = Game.all
     end
     
     private
     
     def game_params
          params.require(:game).permit(:title, :body, :tag, :image)
     end
end
