module SessionsHelper
  def video_params
    params.require(:sessions).permit(:id)
  end
end
