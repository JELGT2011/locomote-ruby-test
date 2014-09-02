class Tabletop
 DIRECTIONS = [:north, :east, :south, :west]
 TABLE_SIZE = 5
 TABLE_MAX = TABLE_SIZE - 1
 attr_accessor :robot, :position

 def place(robot, x, y, facing)
  return unless x >= 0 && x < TABLE_SIZE && y >= 0 && y < TABLE_SIZE && DIRECTIONS.include?(facing)
  @robot = robot
  @position = {x: x, y: y, facing: facing}
  @robot.tabletop = self
  @robot
 end

 def move(robot)
  return unless robot.placed?
  @position[:y] += 1 if @position[:y] < TABLE_MAX && @position[:facing] == :north
  @position[:x] += 1 if @position[:x] < TABLE_MAX && @position[:facing] == :east
  @position[:y] -= 1 if @position[:y] > 0 && @position[:facing] == :south
  @position[:x] -= 1 if @position[:x] > 0 && @position[:facing] == :west
 end

 def left(robot)
  return unless robot.placed?
  @position[:facing] = DIRECTIONS[(DIRECTIONS.index(@position[:facing])-1) % DIRECTIONS.length]
 end

 def right(robot)
  return unless robot.placed?
  @position[:facing] = DIRECTIONS[(DIRECTIONS.index(@position[:facing])+1) % DIRECTIONS.length]
 end
end
