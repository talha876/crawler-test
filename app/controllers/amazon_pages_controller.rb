class AmazonPagesController < ApplicationController

  def show
    @amazon_page = AmazonPage.find(params[:id])
  end

  private

  def set_amazon_page_params
    params.require(:amazon_page).permit(:url)
  end

end
