class SessionsController < ApplicationController
  include SessionsHelper

	def index
	end

	def new
	end

  def wait
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
    @video_id = params[:video_id]
    if Session.any?
      @identity = "second"
    else
      Session.create!(counter: 1)
      @identity = "first"
    end
  end

end
