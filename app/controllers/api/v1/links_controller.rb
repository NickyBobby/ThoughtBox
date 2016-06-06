class Api::V1::LinksController < Api::V1::BaseController
  respond_to :json

  def index
    @user = User.find(params[:id])
    respond_with @user.links
  end

  def update
    respond_with Link.find(params[:id]).update(link_params)
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :read)
    end
end
