require "test_helper"

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test '#weigth - must be greater than 0' do
    food = foods(:brit_care)
    food.weight = -1
    refute food.valid?
    assert_includes food.errors[:weight], 'Value in 0 - 1000'
  end

  test '#Weight - its mamaximum is 1000' do
    food = foods(:brit_care)
    food.weight = 1001
    refute food.valid?
    assert_includes food.errors[:weight], 'Value in 0 - 1000'
  end
end
