class MuscleGroupsController < ApplicationController
  before_action :set_muscle_group, only: %i[ show edit update destroy ]

  # GET /muscle_groups or /muscle_groups.json
  def index
    @muscle_groups = MuscleGroup.all
  end

  # GET /muscle_groups/1 or /muscle_groups/1.json
  def show
  end

  # GET /muscle_groups/new
  def new
    @muscle_group = MuscleGroup.new
  end

  # GET /muscle_groups/1/edit
  def edit
  end

  # POST /muscle_groups or /muscle_groups.json
  def create
    @muscle_group = MuscleGroup.new(muscle_group_params)

    respond_to do |format|
      if @muscle_group.save
        format.html { redirect_to @muscle_group, notice: "Muscle group was successfully created." }
        format.json { render :show, status: :created, location: @muscle_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @muscle_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muscle_groups/1 or /muscle_groups/1.json
  def update
    respond_to do |format|
      if @muscle_group.update(muscle_group_params)
        format.html { redirect_to @muscle_group, notice: "Muscle group was successfully updated." }
        format.json { render :show, status: :ok, location: @muscle_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @muscle_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muscle_groups/1 or /muscle_groups/1.json
  def destroy
    @muscle_group.destroy
    respond_to do |format|
      format.html { redirect_to muscle_groups_url, notice: "Muscle group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle_group
      @muscle_group = MuscleGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def muscle_group_params
      params.require(:muscle_group).permit(:title)
    end
end
