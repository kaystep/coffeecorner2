#items_controller.rb

class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    respond_with Review.all
  end

  def create
    respond_with :api, :v1, Review.create(item_params)
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end

  def update
    item = Review.find(params["id"])
    item.update_attributes(item_params)
    respond_with item, json: item
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :description)
  end
end
