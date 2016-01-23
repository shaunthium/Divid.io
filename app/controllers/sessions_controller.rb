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
    video_id = video_params[:id]
    redirect_to lobby_path(video_id: video_id)
  end

	def join
	end

  def join_submit
    video_id = video_params[:id]
    redirect_to lobby_path(video_id: video_id)
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
