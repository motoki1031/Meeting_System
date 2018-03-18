class AtendeesController < ApplicationController
  before_action :set_atendee, only: [:show, :edit, :update, :destroy]

  # GET /atendees
  # GET /atendees.json
  def index
    @atendees = Atendee.all
    @meetings = Meeting.all
    @users = User.all

  end

  # GET /atendees/1
  # GET /atendees/1.json
  def show
    @atendees = Atendee.all
    @meetings = Meeting.all
    @users = User.all
    #@title = @meetings.find_by(id: @key)
  end

  # GET /atendees/new
  def new
    @atendee = Atendee.new
    @meetings = Meeting.all
    @users = User.all
  end

  # GET /atendees/1/edit
  def edit
    #@atendee = Atendee.new
    @meetings = Meeting.all
    @users = User.all
  end

  # POST /atendees
  # POST /atendees.json
  def create
    @atendee = Atendee.new(atendee_params)
    respond_to do |format|
      if @atendee.save
        format.html { redirect_to @atendee, notice: 'Atendee was successfully created.' }
        format.json { render :show, status: :created, location: @atendee }
      else
        @users = User.all
        @meetings = Meeting.all
        format.html { render :new }
        format.json { render json: @atendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendees/1
  # PATCH/PUT /atendees/1.json
  def update
    respond_to do |format|
      if @atendee.update(atendee_params)
        format.html { redirect_to @atendee, notice: 'Atendee was successfully updated.' }
        format.json { render :show, status: :ok, location: @atendee }
      else
        @users = User.all
        @meetings = Meeting.all
        format.html { render :edit }
        format.json { render json: @atendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendees/1
  # DELETE /atendees/1.json
  def destroy
    @atendee.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Atendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_atendee
    @atendee = Atendee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def atendee_params
    params.require(:atendee).permit(:name, :meeting_id)
  end

end
