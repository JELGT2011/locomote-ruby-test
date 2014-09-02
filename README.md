# Locomote Ruby Test

This repository contains code, test data and specs for a toy robot simulator. For the original specification including what a valid test file looks like, please refer to RoR-Test-Requirements.pdf at the top level of the repository.

I have tried to keep my commits logical and show how I've followed the red-green-refactor process, but I do tend to get on a roll and forget to commit as I go. Typically you'll find commits cover a logical area or refactor.

## Usage

```
$ git clone git@github.com:thecadams/locomote-ruby-test
$ cd locomote-ruby-test
$ ./bin/robot_sim example_a
0,0,NORTH

$ ./bin/robot_sim -v example_a
Loading example_a...
Placing at 0,0,NORTH
Moving
Output: 0,0,NORTH
```

The test files from the PDF are available as `example_{abc}` in the root of this repository.
