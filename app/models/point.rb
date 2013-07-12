class Point
  attr_accessor :x
  attr_accessor :y

  DEFAULT_RANDOM_SIZE = 100

  def initialize(ini_x, ini_y)
    @x = ini_x
    @y = ini_y
  end

  def self.random
    x = rand(DEFAULT_RANDOM_SIZE * 2) - (DEFAULT_RANDOM_SIZE - 1)
    y = rand(DEFAULT_RANDOM_SIZE * 2) - (DEFAULT_RANDOM_SIZE - 1)
    return Point.new(x, y)
  end

  def equal?(point)
    return true if @x == point.x and @y == point.y
    return false
  end

  def add!(point)
    @x += point.x
    @y += point.y
  end

  def add(point)
    new_point = Marshal.load(Marshal.dump(self))
    new_point.x = @x + point.x
    new_point.y = @y + point.y
    return new_point
  end

  def sub!(point)
    @x -= point.x
    @y -= point.y
  end

  def sub(point)
    new_point = Marshal.load(Marshal.dump(self))
    new_point.x = @x - point.x
    new_point.y = @y - point.y
    return new_point
  end

  def identity
    new_point = Marshal.load(Marshal.dump(self))
    new_point.x = 0
    new_point.y = 0
    new_point.x = @x / @x.abs if @x != 0
    new_point.y = @y / @y.abs if @y != 0
    return new_point
  end

  def identity_x
    new_point = identity
    new_point.y = 0
    return new_point
  end

  def identity_y
    new_point = identity
    new_point.x = 0
    return new_point
  end

  def identity_random
    new_point = identity
    if new_point.x != 0 and new_point.y != 0
      if rand(2) > 0
        new_point.x = 0
      else
        new_point.y = 0
      end
    end
    return new_point
  end

  def zero?
    return true if @x == 0 and @y ==0
    return false
  end

  def trail_str
    return 'E' if @x == 1
    return 'W' if @x == -1
    return 'S' if @y == 1
    return 'N' if @y == -1
    return ''
  end
end