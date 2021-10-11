class UsersController < ApplicationController
    # definição das actions:

    before_action :require_logged_in_user, only: [:edit, :update]

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

    def edit
    end

    def update
        if current_user.update(user_params)
            flash[:success] = 'Dados atualizados'
            redirect_to contacts_url
        else
            render 'edit'
        end
    end

    private 
        def user_params 
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end
end
