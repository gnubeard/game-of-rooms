#!/usr/bin/env ruby

class GameOfRooms
  class Point
    attr_accessor :x, :y, :z
    def initialize(x, y, z)
      @x = x
      @y = y
      @z = z
    end
  end
end
