class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.all
    authorize @exercises 
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    authorize @exercise
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    @exercise.build_training
    authorize @exercise
  end

  # GET /exercises/1/edit
  def edit
    authorize @exercise
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.training_id = params[:training_id]

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy
    authorize @exercise
    respond_to do |format|
      format.html { redirect_to @exercise, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :sets, :reps, :rest, :muscle_group, training_attributes: [:title, :training_id, :id])
    end
end
