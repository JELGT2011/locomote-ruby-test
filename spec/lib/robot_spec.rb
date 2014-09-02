require 'spec_helper.rb'

describe Robot do
 let(:tabletop) { Tabletop.new }
 let(:robot) { Robot.new }

 it 'can be placed' do
  expect(tabletop.place(robot,0,0,:south).position).to eq({x:0, y:0, facing: :south})
  expect(robot.placed?).to be_true
 end

 it 'can only face a valid direction' do
  expect(tabletop.place(robot,0,0,'abc')).to be_nil
 end

 it 'must be placed first' do
  expect(robot.placed?).to be_false
  expect(robot.left).to be_nil
  expect(robot.right).to be_nil
  expect(robot.move).to be_nil
  expect(robot.position).to be_nil
 end

 it 'can be placed multiple times' do
  tabletop.place(robot,0,0,:south)
  expect(tabletop.place(robot,0,0,:north).position).to eq({x:0, y:0, facing: :north})
 end

 it 'can be turned left' do
  expect(tabletop.place(robot,0,0,:south).left.position).to eq({x:0, y:0, facing: :east})
  expect(tabletop.place(robot,0,0,:south).left.left.position).to eq({x:0, y:0, facing: :north})
  expect(tabletop.place(robot,0,0,:south).left.left.left.position).to eq({x:0, y:0, facing: :west})
  expect(tabletop.place(robot,0,0,:south).left.left.left.left.position).to eq({x:0, y:0, facing: :south})
 end

 it 'can be turned right' do
  expect(tabletop.place(robot,0,0,:south).right.position).to eq({x:0, y:0, facing: :west})
  expect(tabletop.place(robot,0,0,:south).right.right.position).to eq({x:0, y:0, facing: :north})
  expect(tabletop.place(robot,0,0,:south).right.right.right.position).to eq({x:0, y:0, facing: :east})
  expect(tabletop.place(robot,0,0,:south).right.right.right.right.position).to eq({x:0, y:0, facing: :south})
 end

 it 'can move north' do
  expect(tabletop.place(robot,0,0,:north).move.position).to eq({x:0, y:1, facing: :north})
 end

 it 'can move south' do
  expect(tabletop.place(robot,0,1,:south).move.position).to eq({x:0, y:0, facing: :south})
 end

 it 'can move east' do
  expect(tabletop.place(robot,0,0,:east).move.position).to eq({x:1, y:0, facing: :east})
 end

 it 'can move west' do
  expect(tabletop.place(robot,1,0,:west).move.position).to eq({x:0, y:0, facing: :west})
 end
end
