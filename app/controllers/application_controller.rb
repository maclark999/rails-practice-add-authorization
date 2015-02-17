class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_student
    @current_student ||= Student.find_by_id(session[:student_id])
  end

  def authenticate
    if not current_student
      flash[:notice]= "Not Signed in"
      redirect_to login_path
    end
  end

  helper_method :current_student

end
