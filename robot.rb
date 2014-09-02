class Robot
 attr_accessor :tabletop

 def left
  return unless placed?
  @tabletop.left(self)
  self
 end

 def right
  return unless placed?
  @tabletop.right(self)
  self
 end

 def move
  return unless placed?
  @tabletop.move(self)
  self
 end

 def position
  return unless placed?
  @tabletop.position
 end

 def placed?
  !!@tabletop
 end
end
