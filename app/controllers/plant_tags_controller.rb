class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    ## find the multiple tags coming from the params
    @tags = Tag.where(id: params[:plant_tag][:tag_id])
    @tags.each do |tag|
      #create one PlantTag per Tag selected
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def tag_params
    params.require(:plant_tag).permit(:tag_id)
  end



end
