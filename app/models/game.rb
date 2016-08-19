class Game
  attr_accessor :player_1, :player_2

  def initialize(size_of_matrix = 10, number_of_navies = 20)
    @player_1 = Matrixi.new(size_of_matrix, number_of_navies)
    @player_2 = Matrixi.new(size_of_matrix, number_of_navies)
    @player_1.fill_with_navies
    @player_2.fill_with_navies
    @turn_1 = [true, false].sample
    @turn_2 = !@turn_1
  end

  def turn_of_1?
    @turn_1
  end

  def turn_of_2?
    @turn_2
  end

  def play(user = 1, x, y)
    if user == 1 && turn_of_1?
      @player_2.attacked(x, y)
      @turn_1 = 1
      @turn_2 = 0
      return @player_2.lost?
    elsif user == 2 && turn_of_2?
      @player_1.attacked(x, y)
      @turn_1 = 0
      @turn_2 = 1
      return @player_1.lost?
    end
    return false
  end

  def player_1_won?
    @player_2.lost?
  end

  def player_2_won?
    @player_1.lost?
  end
end
