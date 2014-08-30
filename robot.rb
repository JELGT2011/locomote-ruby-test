class Robot
 DIRECTIONS = [:north, :east, :south, :west]
 attr_accessor :placed, :x, :y, :facing

 def initialize
 end

 def place(x, y, facing)
  return unless DIRECTIONS.include?(facing)
  @x = x
  @y = y
  @facing = facing
  @placed = true
  self
 end

 def left
  return unless placed?
  @facing = DIRECTIONS[(DIRECTIONS.index(@facing)-1) % DIRECTIONS.length]
  self
 end

 def right
  return unless placed?
  @facing = DIRECTIONS[(DIRECTIONS.index(@facing)+1) % DIRECTIONS.length]
  self
 end

 def move
  return unless placed?
  @y += 1 if @facing == :north
  @x += 1 if @facing == :east
  @y -= 1 if @facing == :south
  @x -= 1 if @facing == :west
  self
 end

 def position
  return unless placed?
  {x: x, y: y, facing: facing}
 end

 def placed?
  !!@placed
 end
end
