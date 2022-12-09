# Day 15: [Science for Hungry People](https://adventofcode.com/2015/day/15)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/15/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/15/part2.pi)*

Another fun constraint satisfaction problem.

## Part 1

This one immediately jumped out as a constraint satisfaction problem, so I set to work trying to express the constraints. I got a bit confused along the way but eventually muddled through. At some point I got stuck with an inexplicable uninitialised value which I expected would cause a runtime error, but didn't. Guess this is a Prolog sort of thing.

The solution took about 27 seconds to run using the `cp` module, which seemed slow given the fairly limited bounds of the variables. I tried a few things to speed things up:

* Swapping `cp` for the `sat` module made it slower and I killed the process after about 2 minutes
* Using the `mip` module, the CBC solver took 55.59 seconds and failed to find a solution
* Adding a few more bounds annotations (previously suggested to me by Hakan Kjellerstrand) with `cp` again: 10.27s
* ...with `sat`: 26.86s
* ...with the `smt` which spawns `z3`: killed it after it ran for almost 23 minutes without getting anywhere
* ...with `smt` and `cvc4`: killed it after it ran for 4 minutes with no output
* Adding `split` to the `cp` solver options: 3.67s
* `cp` and `reverse_split`: 3.095s (best so far)
* Adding even more bounds annotations: no difference (for `cp`, at least)
* Reducing bounds for each weighted cookie properties (e.g. `Cap`) from `-10000..10000` to `-500..500`: 7.18s with `split`, 5.95s with `reverse_split` (why?? looking at my input data, it can't be greater than `-500..500`; surely that should constrain the search more effectively?)
* Trying `mip` again with the `glpk` solver: gave up after 13 minutes

It's possible that adding a few more/better annotations would help, but I'm once again impressed at how good Picat's built-in solvers are.

## Part 2

Another problem whose part 2 was only a trivial addition to the part 1 solution thanks to Picat's constraint solver. The extra constraint `TCals #= 500` significantly reduces the search space, so the `cp` module finds the correct solution in about 800 ms.

## Reflections

Enjoyed this one!

## Error collection

None.
