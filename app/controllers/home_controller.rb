class HomeController < ApplicationController
    def index
        @artists = Artist.all
        render json: @artists
    end

    def users
        @users = User.all
        render json: @users
    end

    def allRecords
        @records = Record.all
        
        render json: @records
    end
end