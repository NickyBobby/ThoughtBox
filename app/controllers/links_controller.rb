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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.assign_attributes(link_params)
    if @link.valid?
      @link.save
      redirect_to root_path
    else
      flash[:danger] = "Invalid URL"
      render :edit
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url, :read)
    end
end
