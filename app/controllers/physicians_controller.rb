class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @physician = Physician.where('name ILIKE ? OR specialty ILIKE ?',  "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @physician = Physician.all
    end
  end

  def show
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to @physician
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @physician.update(physician_params)
      redirect_to @physician
    else
      render :new
    end
  end

  def destroy
    @physician.destroy
    redirect_to root_path
  end

  private
  def physician_params
    params.require(:physician).permit(:search ,:name, :specialty)
  end

  def set_physician
    @physician = Physician.find(params[:id])
  end

end
