class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_patient

  def is_authenticated
    unless current_patient
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  def current_patient
    @current_patient ||= Patient.find_by_id(session[:patient_id])
  end
end
