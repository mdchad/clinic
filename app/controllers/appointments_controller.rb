class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:index]

  # GET /appointments
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/:specialityid/new
  def new
    @appointment = Appointment.new
    @complaint = Complaint.new
    @doctors = Doctor.where(specialty_id: params[:specialty_id])
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_patient.id if current_patient
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      redirect_to appointments_path, notice: 'Irsyad says no.'
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:complaint, :date, :patient_id, :doctor_id)
    end
end
