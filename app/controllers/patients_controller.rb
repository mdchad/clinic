class PatientsController < ApplicationController
  # GET /register
  def new
    @patient = Patient.new
  end

  # POST /register
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      session[:patient_id] = @patient.id
      flash[:success] = "Welcome!"
      redirect_to profile_url
    else
      render :new
    end
  end

  # GET /profile
  def show
    @patient = current_patient
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :family_name, :email, :password, :password_confirmation)
  end

end
