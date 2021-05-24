class TrainingsController < ApplicationController
  before_action :set_training, only: %i[ show edit update destroy ]
  before_action :set_student, only: %i[ show new edit create update destroy ]
  before_action :authenticate_user!

  # GET /trainings or /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1 or /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
    @training.build_student
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params)

    # @training.student_id = @student.id
    @training.student_id = params[:student_id]

    respond_to do |format|
      if @training.save
        format.html { redirect_to student_url(@training.student_id), notice: "Training was successfully created." }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to student_url(@training.student_id), notice: "Training was successfully updated." }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to student_url(@training.student_id), notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:title, student_attributes: [:name])
    end
end
