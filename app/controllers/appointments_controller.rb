class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
    # @patients = @patient.appointments.where(role: 'Patient')
    # @physicians = @physician.appointments.where(role: 'Physician')
  end

  def new
    @patients = Patient.all# - @physician.patients
    @appointment = @physician.appointments.new
    #@physician = Physician.all - @physician.patients
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_appointments_path(@physician)
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to physician_appointments_path(@physician)
    else
      render :edit
    end
  end

def show
end

def edit
  @patients = Patient.all
  render :new
end

  def destroy
    @appointment.destroy
    redirect_to physician_appointments_path(@physician)
    # redirect_to root_path
  end

  private
  def set_physician
    @physician = Physician.find(params[:physician_id]) 
  end

  def set_appointment
    @appointment = @physician.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :role, :patient_id, :physician_id)
  end

  def datepicker_input form, field
    content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
      form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
    end
  end

end
