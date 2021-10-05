class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # todos os controllers que herdam de ApplicationController terão os modulos do SessionsHelper
    include SessionsHelper

    private
        def require_logged_in_user
            unless  user_signed_in?
                flash[:danger] = 'Área restrita. Por favor, realize o login'
                redirect_to entrar_path                    
            end
        end

end
