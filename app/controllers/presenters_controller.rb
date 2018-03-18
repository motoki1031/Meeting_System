# -*- coding: utf-8 -*-
require 'kconv'
class PresentersController < ApplicationController
  before_action :set_presenter, only: [:show, :edit, :update, :destroy]

  # GET /presenters
  # GET /presenters.json
  def index
    @presenters = Presenter.all
    @meetings = Meeting.all
    @users = User.all
  end

  # GET /presenters/1
  # GET /presenters/1.json
  def show
    @presenters = Presenter.all
    @meetings = Meeting.all
    @users = User.with_deleted.all
  end

  # GET /presenters/new
  def new
    @presenter = Presenter.new
    @meetings = Meeting.all
    @users = User.all
  end



  # GET /presenters/1/edit
  def edit
    #@presenter = Presenter.new
    @meetings = Meeting.all
    @users = User.all
  end

  # POST /presenters
  # POST /presenters.json
  def create
    @presenter = Presenter.new(presenter_params)

    if params[:presenter][:file].nil? != true
      file = presenter_params[:file]
      file_path = file.original_filename
      @presenter.filepath = file.original_filename
      result = uploadpdf(file,file_path)
      respond_to do |format|
        if result=="success" && @presenter.save
          format.html { redirect_to @presenter, notice: 'Presenter was successfully created.' }
          format.json { render action: 'show', status: :created, location: @presenter }
        else
          deleteipdf(file_path)
          format.html { render action: 'new' }
          format.json { render json: @presenter.errors, status: :unprocessable_entity }
        end
      end
    else

      respond_to do |format|
        if @presenter.save
          format.html { redirect_to @presenter, notice: 'Presenter was successfully created.' }
          format.json { render :show, status: :created, location: @presenter }
        else
          @users = User.all
          @meetings = Meeting.all
          format.html { render :new }
          format.json { render json: @presenter.errors, status: :unprocessable_entity }
        end
      end
    end

  end
  # PATCH/PUT /presenters/1
  # PATCH/PUT /presenters/1.json
  def update
    file = Presenter.find(params[:id])
    if file[:filepath].nil? != true
      file_name = file[:filepath]
      #File.delete("#{Dir.home}/rails/Yamasita/public/yokolab/#{file_name}")
      File.delete("/var/www/MeetingSystem/public/#{file_name.toutf8}")
      @presenter.destroy
    else
      @presenter.destroy
    end
    @presenter = Presenter.new(presenter_params)

    if params[:presenter][:file].nil? != true
      file = presenter_params[:file]
      file_path = file.original_filename
      @presenter.filepath = file.original_filename
      result = uploadpdf(file,file_path)
      respond_to do |format|
        if result=="success" && @presenter.save
          format.html { redirect_to @presenter, notice: 'Presenter was successfully created.' }
          format.json { render action: 'show', status: :created, location: @presenter }
        else
          deleteipdf(file_path)
          format.html { render action: 'new' }
          format.json { render json: @presenter.errors, status: :unprocessable_entity }
        end
      end
    else

      respond_to do |format|
        if @presenter.save
          format.html { redirect_to @presenter, notice: 'Presenter was successfully created.' }
          format.json { render :show, status: :created, location: @presenter }
        else
          @users = User.all
          @meetings = Meeting.all
          format.html { render :new }
          format.json { render json: @presenter.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /presenters/1
  # DELETE /presenters/1.json
  def destroy
    file = Presenter.find(params[:id])
    if file[:filepath].nil? != true
      file_name = file[:filepath]
      #File.delete("#{Dir.home}/rails/Yamasita/public/yokolab/#{file_name}")
      File.delete("/var/www/MeetingSystem/public/#{file_name.toutf8}")
      @presenter.destroy
      respond_to do |format|
        format.html { redirect_to request.referer, notice: 'Presenter was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @presenter.destroy
      respond_to do |format|
        format.html { redirect_to request.referer, notice: 'Presenter was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def uploadpdf(file_object,file_name)
    if file_object.size > 10.megabyte
      result = 'ファイルサイズは10MBまでです。'
    else
      File.open("/home/motoki/MeetingSystem/public/#{file_name.toutf8}", 'wb') { |f| f.write(file_object.read) }
      result = "success"
    end
    return result
  end

  def downloadpdf
    presen = Presenter.find(params[:id])
    if presen.filepath.nil? != true
      file = Rails.root.join("/home/motoki/MeetingSystem/public", presen.filepath)

      stat = File::stat(file)
      send_file(file, :filepath => presen.filepath, :length => stat.size)
    else
      respond_to do |format|
        format.html { redirect_to presenters_url, notice: 'Not Download.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share commaon setup or constraints between actions.
  def set_presenter
    @presenter = Presenter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def presenter_params
    file1 = params[:presenter][:file].nil?
    if file1 != true
      params.require(:presenter).permit(:name, :title, :document1, :document2, :document3, :document4, :meeting_id, :file)
    else
      params.require(:presenter).permit(:name, :title, :document1, :document2, :document3, :document4, :meeting_id)
    end
  end

  def deleteipdf(file_path)
    #File.unlink "#{Dir.home}/rails/Yamasita/public/yokolab/"+file_path.toutf8
  end
end
