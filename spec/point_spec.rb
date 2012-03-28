require 'game_of_rooms/point'
require 'rubygems'
require 'minitest/autorun'

describe GameOfRooms::Point do
  it 'accepts x,y,z during initialization' do
    point = GameOfRooms::Point.new(1, 2, 3)

    point.x must_equal 1
    point.y must_equal 2
    point.z must_equal 3
  end

  describe 'moving' do
    before do
      @point = GameOfRooms::Point.new(0, 0, 0)
    end

    it 'increments x on right' do
      @point.right

      @point.x must_equal 1
      @point.y must_equal 0
      @point.z must_equal 0
    end

    it 'decrements x on left' do
      @point.left

      @point.x must_equal -1
      @point.y must_equal 0
      @point.z must_equal 0
    end

    it 'increments y on forward' do
      @point.forward

      @point.x must_equal 0
      @point.y must_equal 1
      @point.z must_equal 0
    end

    it 'decrements y on back' do
      @point.back

      @point.x must_equal 0
      @point.y must_equal -1
      @point.z must_equal 0
    end

    it 'increments z on up' do
      @point.up

      @point.x must_equal 0
      @point.y must_equal 0
      @point.z must_equal 1
    end

    it 'decrements z on down' do
      @point.down

      @point.x must_equal 0
      @point.y must_equal 0
      @point.z must_equal -1
    end
  end
end
