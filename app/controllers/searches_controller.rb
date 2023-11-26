class SearchesController < ApplicationController

    def search
        @rooms = Room.search(params[:search])
    end

end
