class HomeController < ApplicationController
    def index
        render plain: "Welcome to the PlayPal"
    end
end