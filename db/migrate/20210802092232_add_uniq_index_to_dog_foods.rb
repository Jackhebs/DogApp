class AddUniqIndexToDogFoods < ActiveRecord::Migration[6.1]
  def change
    add_index :dog_foods, [:dog_id, :food_id], unique: true
  end
end
