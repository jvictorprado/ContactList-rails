class UsersController < ApplicationController
    # definição das actions:


    # renderiza o formulário 
    def new
        @user = User.new
    end


    # recebe um post pra fazer a criação da rota
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'Usuário cadastrado com sucesso'
            redirect_to root_url
        else
            render 'new'
        end
    end

    private 
        def user_params 
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end
end
