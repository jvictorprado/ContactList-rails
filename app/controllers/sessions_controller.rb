class SessionsController < ApplicationController
  
  # previnir que o usuário já logado não "entre de novo" na aplicação
  def new
    redirect_to user_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      # redirecionando
      redirect_to contacts_path
    else
      flash.now[:danger] = 'Email ou senha inválidos'
      render 'new'  
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Logout com sucesso'
    redirect_to entrar_path
  end

end
