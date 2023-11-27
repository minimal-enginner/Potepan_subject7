class SearchesController < ApplicationController

    def top
        @rooms = Room.search(params[:search])
    end

    def search
        @rooms = Room.search(params[:search])
    end

end
