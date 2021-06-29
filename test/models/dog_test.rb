require "test_helper"

class DogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test '#age - values are calculated correctly' do
    dog = dogs(:dog1)
    dog.birthdate = 18.months.ago
    age = dog.age
    assert_equal 1, age[:years]
    assert_equal 6, age[:months]
  end

  test '#weigth - must be greater than 0' do
    dog = dogs(:dog1)
    dog.weight = -1
    refute dog.valid?
    assert_includes dog.errors[:weight], 'must be greater than 0'
  end

  test '#weigth - must be less than 161' do
    dog = dogs(:dog1)
    dog.weight = 162
    refute dog.valid?
    assert_equal 'must be less than 161', dog.errors[:weight][0]
    assert_includes dog.errors[:weight], 'must be less than 161'
  end

  test '#name - must be a dog name' do
    dog = dogs(:dog1)
    dog.name = dog.weight, dog.birthdate
    refute dog.valid?
    assert_includes dog.errors[:name], 'must be a dog name'
  end

  test '#name - dog name length is greater than 2 letters' do
    dog = dogs(:dog1)
    dog.name = 'DA'
    refute dog.valid?
    assert_includes dog.errors[:name], 'must be greater than 2 letters'
  end

  test' invalid without name' do
    dog = dogs(:dog1)
    dog.name = nil
    refute dog.valid?
    assert_includes dog.errors[:name], "can't be blank"
  end
end