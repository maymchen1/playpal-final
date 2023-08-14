class HomeController < ApplicationController
    def index
        render plain: "Welcome to PlayPal" 
    end
end