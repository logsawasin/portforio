class Users::HomesController < ApplicationController
    def top
        @game = Game.all
    end
end