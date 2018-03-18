class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @users = User.all
    @atendees = Atendee.all
    @presentes = Presenter.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.with_deleted.find(params[:id])
    @atendess = Atendee.where(meeting_id: @meeting.id)
    @presenters = Presenter.where(meeting_id: @meeting.id)
    @users = User.all
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @users = User.all
    @atendee = Atendee.new
    @presenter = Presenter.new
    @count = @users.count
    @select_users = User.select(:name).distinct

  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:title, :times, :attribute, :room, :started_at, :closed_at, :remarks, :registered_at, :updated_at, :deleted_at, :category)
  end


end
