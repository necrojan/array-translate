# frozen_string_literal: true

class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  attr_reader :capacity

  attr_reader :occupants

  def full?
    return false if occupants.count < capacity

    true
  end

  def available_space
    capacity - occupants.count
  end

  def add_occupant(person)
    return false if full?

    @occupants << person
    true
  end
end
