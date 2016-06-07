class Api::V1::LinksController < Api::V1::BaseController
  respond_to :json

  def index
    @user = User.find(params[:id])
    respond_with @user.links
  end

  def create
    respond_with :api, :v1, Link.create(link_params), location: nil
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    respond_with @link
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :read, :user_id)
    end
end
