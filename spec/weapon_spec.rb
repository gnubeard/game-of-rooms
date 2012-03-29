require 'game_of_rooms/weapon'
require 'rubygems'
require 'minitest/autorun'

describe GameOfRooms::Weapon do
  it 'accepts name, damage during initialization' do
    weapon = GameOfRooms::Weapon.new('a gun', 10)

    weapon.name.must_equal 'a gun'
    weapon.damage.must_equal 10
  end

  describe 'attacking' do
    class Lifelike; attr_accessor :life; end 
    before do
      @weapon = GameOfRooms::Weapon.new('knife', 5)
      @monster = Lifelike.new
      @monster.life = 11
    end

    it "subtracts the weapon's damage from its target" do
      @weapon.attack @monster
      @monster.life.must_equal 6
    end
  end
end
