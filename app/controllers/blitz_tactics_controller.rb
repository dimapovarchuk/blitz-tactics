class BlitzTacticsController < ApplicationController
  before_action :set_blitz_tactic, only: %i[ show edit update destroy ]

  # GET /blitz_tactics
  def index
    @blitz_tactics = BlitzTactic.all
  end

  # GET /blitz_tactics/1
  def show
  end

  # GET /blitz_tactics/new
  def new
    @blitz_tactic = BlitzTactic.new
  end

  # GET /blitz_tactics/1/edit
  def edit
  end

  # POST /blitz_tactics
  def create
    @blitz_tactic = BlitzTactic.new(blitz_tactic_params)

    if @blitz_tactic.save
      redirect_to @blitz_tactic, notice: "Blitz tactic was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blitz_tactics/1
  def update
    if @blitz_tactic.update(blitz_tactic_params)
      redirect_to @blitz_tactic, notice: "Blitz tactic was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blitz_tactics/1
  def destroy
    @blitz_tactic.destroy
    redirect_to blitz_tactics_url, notice: "Blitz tactic was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blitz_tactic
      @blitz_tactic = BlitzTactic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blitz_tactic_params
      params.require(:blitz_tactic).permit(:amount, :company, :contragent, :currency, :date)
    end
end
