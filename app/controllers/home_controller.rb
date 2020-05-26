class HomeController < ApplicationController
    def index
        @artists = Artist.all
        render json: @artists
    end

    def users
        @users = User.all
        render json: @users
    end
end