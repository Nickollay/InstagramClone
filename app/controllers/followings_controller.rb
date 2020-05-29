class FollowingsController
  def index
    @user = User.find(params[:id])
    @followings = @user.followings
  end
end
