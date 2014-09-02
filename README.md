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

## Running tests

```
$ git clone git@github.com:thecadams/locomote-ruby-test
$ cd locomote-ruby-test
$ rspec
```

## Notes

The initial implementation was just a `Robot` but the tests guided me towards `Robot` not being able to set its own position, or know the dimensions of the world. Therefore to match the wording of the spec, I added a `Tabletop`.

Next, my intuition suggested `Tabletop` should be capable of managing multiple objects, but the spec didn't call for it and the tests didn't guide me to implement that. So `Tabletop` currently only knows about its `Robot`. YAGNI! If that becomes necessary later, it'll be easy to refactor because the tests thoroughly cover `Robot`'s behaviour.

Also: it turns out Markdown backticks need to be escaped when committing with `-m` on the command-line. Interactive rebase saved me on that one - you can't see the commits before editing, but they had a double whitespace where `Robot` or `Tabletop` were.

I then had to think carefully about what to call the binary that users would run; `robot.rb` is taken! So I went with `bin/robot_sim`.

