class SessionsController < ApplicationController
  include SessionsHelper

	def index
    @session = Session.new
	end

	def new
	end

  def wait
  end

  def create_image
    @session = Session.new
    @session.image = params[:session][:image]
    if @session.save
      redirect_to lobby_path
    end
  end

  def create_video
    @session = Session.new
    @session.video = params[:session][:video]
    if @session.save
      redirect_to lobby_path
    end
  end

  def create
    channel_name = video_params[:channel_name]
    upload_video = video_params[:upload_video]
    num_people = video_params[:num_people]
    redirect_to lobby_path(channel_name: channel_name)
  end

	def join
	end

  def join_submit
    channel_name = video_params[:channel_name]
    redirect_to lobby_path(channel_name: channel_name)
  end

	def lobby
    @session = Session.last
    @video_id = params[:video_id]
    if Session.any?
      @identity = "second"
    else
      Session.create!(counter: 1)
      @identity = "first"
    end
  end

  private
    def image_params
      params.require(:session).permit(:image)
    end

end
