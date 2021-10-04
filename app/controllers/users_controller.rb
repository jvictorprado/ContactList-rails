class UsersController < ApplicationController
    # definição das actions:


    # renderiza o formulário 
    def new
        @user = User.new
    end


    # recebe um post pra fazer a criação da rota
    def create
    end

end
