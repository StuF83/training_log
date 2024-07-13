require 'rails_helper'

RSpec.describe Workout, type: :model do
  # Setup a valid attribute set for use in tests
  let(:valid_attributes) {
    {workout_type: 'Run', duration: 30, intensity: 'high', date: Date.yesterday}
  }

  # Check that the factory is valid
  it 'is valid with valid attributes' do
    expect(Workout.new(valid_attributes)).to be_valid
  end

  # Check for presence validations
  it 'is invalid without a workout_type' do
    workout = Workout.new(valid_attributes.merge(workout_type: nil))
    expect(workout).to_not be_valid
  end

  it 'is invalid without a duration' do
    workout = Workout.new(valid_attributes.merge(duration: nil))
    expect(workout).to_not be_valid
  end

  it 'is invalid without an intensity' do
    workout = Workout.new(valid_attributes.merge(intensity: nil))
    expect(workout).to_not be_valid
  end

  it 'is invalid without a date' do
    workout = Workout.new(valid_attributes.merge(date: nil))
    expect(workout).to_not be_valid
  end

  # Check date is not in future
  it 'is invalid if date is in the future' do
    workout = Workout.new(valid_attributes.merge(date: Date.today + 1))
    expect(workout).to_not be_valid
  end

  # Check workout_type is valid
  it 'is invalid if workout_type is not valid option' do
    workout = Workout.new(valid_attributes.merge(intensity: 'HIIT'))
    expect(workout).to_not be_valid
  end

  # Check duration is positive number
  it 'is invalid if duration is a negative number' do
    workout = Workout.new(valid_attributes.merge(duration: -1))
    expect(workout).to_not be_valid
  end

end