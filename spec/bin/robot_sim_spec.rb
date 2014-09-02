describe 'bin/robot_sim' do
 it 'validates input before execution' do
  expect(`./bin/robot_sim ./spec/fixtures/invalid_input`).to eq(
   "Error: invalid input on line 1: Some invalid data
Error: invalid input on line 2: MOVEa
Error: invalid input on line 3: LEFTa
Error: invalid input on line 4: RIGHTa
Error: invalid input on line 5: REPORTa
Error: invalid input on line 6: PLACE -1,0,NORTH
Error: invalid input on line 7: PLACE 0,-1,NORTH
Error: invalid input on line 8: PLACE 0,0,DECEMBER
")
 end

 it 'ignores comments' do
  expect(`./bin/robot_sim ./spec/fixtures/comments`).to eq ''
 end

 it 'executes instructions' do
  expect(`./bin/robot_sim ./spec/fixtures/instructions`).to eq(
'4,4,NORTH
0,0,WEST
')
 end
end
