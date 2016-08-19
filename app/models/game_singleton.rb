require 'singleton'

class GameSingleton
  include Singleton

  attr_accessor :game

  def initialize()
    @game = Game.new
  end

end
