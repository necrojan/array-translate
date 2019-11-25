# frozen_string_literal: true

require_relative 'room'

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}

    hash.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  attr_reader :rooms

  def room_exists?(name)
    @rooms.key?(name)
  end

  def check_in(person, room_name)
    unless room_exists?(room_name)
      puts 'sorry, room does not exist'
      return
    end

    added = rooms[room_name].add_occupant(person)

    if !added
      puts 'sorry, room is full'
    else
      puts 'check in successful'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each do |name, room|
      puts "#{name} : #{room.available_space}"
    end
  end
end
