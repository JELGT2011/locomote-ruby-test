describe Tabletop do
 let(:tabletop) { Tabletop.new }
 let(:robot) { Robot.new }

 TABLE_SIZE = 5
 TABLE_MAX = TABLE_SIZE - 1

 it 'can place the robot' do
  tabletop.place(robot,0,0,:south)
  expect(robot.placed?).to be_true
 end

 it 'can only be placed within a TABLE_SIZE x TABLE_SIZE area' do
  expect(tabletop.place(robot,-1,0,:south)).to be_nil
  expect(robot.placed?).to be_false
  expect(tabletop.place(robot,0,-1,:south)).to be_nil
  expect(robot.placed?).to be_false
  expect(tabletop.place(robot,0,TABLE_MAX+1,:south)).to be_nil
  expect(robot.placed?).to be_false
  expect(tabletop.place(robot,TABLE_MAX+1,0,:south)).to be_nil
  expect(robot.placed?).to be_false
 end

 it 'can only face a valid direction' do
  expect(tabletop.place(robot,0,0,'abc')).to be_nil
  expect(robot.placed?).to be_false
 end

 it 'prevents the robot falling off the edge' do
  tabletop.place(robot,0,0,:south)
  expect(robot.placed?).to be_true
  robot.move
  expect(robot.position).to eq({x:0, y:0, facing: :south})

  tabletop.place(robot,0,0,:west)
  robot.move
  expect(robot.position).to eq({x:0, y:0, facing: :west})

  tabletop.place(robot,TABLE_MAX,TABLE_MAX,:north)
  robot.move
  expect(robot.position).to eq({x:TABLE_MAX, y:TABLE_MAX, facing: :north})

  tabletop.place(robot,TABLE_MAX,TABLE_MAX,:east)
  robot.move
  expect(robot.position).to eq({x:TABLE_MAX, y:TABLE_MAX, facing: :east})
 end
end
