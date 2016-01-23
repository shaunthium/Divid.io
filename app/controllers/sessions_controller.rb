class SessionsController < ApplicationController

	def index
    @session = Session.new
	end

  def wait
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.new
    @session.video = params[:session][:video]
    @session.num_people = params[:session][:num_people]
    @session.channel_name = params[:session][:channel_name]
    @session.master = true
    if @session.save
      redirect_to wait_path(channel_name: @session.channel_name, id: @session)
    end
  end


  def join
    @session.channel_name = params[:session][:channel_name]
    if @session.save
      redirect_to wait_path(channel_name: @session.channel_name, id: @session)
    end
  end

	def lobby
    @session = Session.last
    if Session.any?
      @identity = "second"
    else
      Session.create!(counter: 1)
      @identity = "first"
    end
  end
end
