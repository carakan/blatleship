class Matrixi
  attr_accessor :matrix

  def initialize(size = 10, number_of_navies = 20)
    @matrix = Array.new(size) { Array.new(size) }

    @navies = number_of_navies
    @matrix.each_with_index do |cols, col_index|
      cols.each_with_index do |_elem, index|
        @matrix[col_index][index] = 0
      end
    end
  end

  def set_value(x, y, value)
    @matrix[x][y] = value
  end

  def fill_with_navies()
    points = @navies
    size = @matrix.size - 1
    while points > 0 do
      x_index = rand(0..size)
      y_index = rand(0..size)
      if @matrix[x_index][y_index] == 0
        @matrix[x_index][y_index] = 1
        points -= 1
      end
    end
  end

  def check_matrix(check_for = 0)
    count = 0
    @matrix.each do |cols|
      cols.each do |elem|
        if elem == check_for
          count += 1
        end
      end
    end
    count
  end

  def check_blank
    self.check_matrix(0)
  end

  def check_navies
    check_matrix(1)
  end

  def check_blank_used
    self.check_matrix(2)
  end

  def check_navies_destroyed
    self.check_matrix(3)
  end

  def attacked(x, y)
    if @matrix[x][y] == 0 || @matrix[x][y] == 1
      @matrix[x][y] += 2
      return true
    else
      return false
    end
  rescue
    return false
  end

  def lost?
    self.check_navies <= 0
  end
end
