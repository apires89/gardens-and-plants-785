class AddWaterToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :water, :string
  end
end
