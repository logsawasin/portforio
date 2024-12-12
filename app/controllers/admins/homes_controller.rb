class Admins::HomesController < ApplicationController
     before_action :authenticate_admin!
     
     def top
        @game = Game.all
     end
     
end
