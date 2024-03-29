class GuardiansController < ApplicationController
  before_filter :set_student, only: [:new, :create]
  def index
    @guardian = Guardian.all
  end

  def show
    @guardian = Guardian.find(params[:id])
  end

  def new
    @guardian = Guardian.new
  end

  def create
    @guardian = Guardian.new(params[:guardian])
    if @guardian.save
      flash[:success] = ' Parent Record Saved Successfully. Please fill the Additional Details.'
      redirect_to new_student_student_previous_datum_path(@student)
    else
      flash.now[:error] = 'An error occurred please try again!'
      render 'new'
    end
  end

  def edit
  end

  private
  def set_student
    @student = Student.find params[:student_id]
  end

end
