class TopsController < ApplicationController
  PER = 6
  def index
    @meetings =  Meeting.all.order(started_at: :desc).page(params[:page]).per(PER)
  	@presenters = Presenter.all
  	@select_attribution = Meeting.select(:category).distinct
    @meeting_all = Meeting.all
    @users = User.all
  end

  def show
    @meeting = Meeting.with_deleted.find(params[:id])
    @atendess = Atendee.where(meeting_id: @meeting.id)
    @presenters = Presenter.where(meeting_id: @meeting.id)
    @users = User.all
  end

  def find
    @q = Meeting.ransack(search_params)
    @meetings = @q.result(distinct: true).order(started_at: :desc).page(params[:page]).per(PER)
    @select_attribution = Meeting.select(:category).distinct
    @presenters = Presenter.all
    @count = @q.result.distinct.count
    @users = User.all
    @atendees = Atendee.all
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
