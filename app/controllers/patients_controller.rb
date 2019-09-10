class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index

    if params[:search]
      @patient = Patient.where('name ILIKE ? OR age ILIKE ?',  "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @patient = Patient.all
    end
    # @patients = Patient.search(params[:search])
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to @patient
      else
        render :new
      end
  end

def edit
  render :new
end

def update
  if @patient.update(patient_params)
    redirect_to @patient
  else
    render :edit
  end
end

def destroy
  @patient.destroy
  redirect_to root_path
end

private
  def patient_params
    params.require(:patient).permit(:search, :name, :age, :phone_number, :reason)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  

end
