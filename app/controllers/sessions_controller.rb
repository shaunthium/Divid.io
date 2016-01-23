class SessionsController < ApplicationController
  include SessionsHelper

	def index
	end

	def new
	end

  def wait
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
    @video_id = params[:video_id]
    if Session.any?
      @identity = "second"
    else
      Session.create!(counter: 1)
      @identity = "first"
    end
  end

end
