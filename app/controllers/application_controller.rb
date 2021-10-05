class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # todos os controllers que herdam de ApplicationController terão os modulos do SessionsHelper
    include SessionsHelper

end
