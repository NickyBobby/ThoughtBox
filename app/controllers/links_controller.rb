class LinksController < ApplicationController
  def index

  end

  def create
    @link = current_user.links.create(link_params)
    if @link.save
      redirect_to root_path
    else
    end
  end

  def update
    Link.find(params[:id]).update(link_params)
    render :index
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :read)
    end
end
