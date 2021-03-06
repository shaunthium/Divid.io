class SessionsController < ApplicationController

	def index
    @session = Session.new
	end

  def wait
    master_session = get_master_session
    @num_people = master_session.num_people
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.new
    @session.video = params[:session][:video]
    @session.num_people = params[:session][:num_people]
    @session.channel_name = params[:session][:channel_name].downcase
    @session.master = true
    if @session.save
      redirect_to wait_path(channel_name: @session.channel_name, id: @session)
    end
  end


  def join
    @session = Session.new
    @session.channel_name = params[:session][:channel_name].downcase
    if @session.save
      redirect_to wait_path(channel_name: @session.channel_name, id: @session)
    end
  end

	def lobby
    master_session = get_master_session
    @video = master_session.video
    @channel_name = params[:channel_name]
    @session = Session.find(params[:id])
    sessions = Session.where(channel_name: params[:channel_name])
    if master_session.num_people == 2
      if @session == sessions.first
        @identity = "first-2"
      elsif @session == sessions.second
        @identity = "second-2"
      end
    elsif master_session.num_people == 4
      if @session == sessions.first
        @identity = "first-4"
      elsif @session == sessions.second
        @identity = "second-4"
      elsif @session == sessions.third
        @identity = "third-4"
      elsif @session = sessions.fourth
        @identity = "fourth-4"
      end
    end
  end

  private
    def get_master_session
      Session.find_by(channel_name: params[:channel_name], master: true)
    end
end
