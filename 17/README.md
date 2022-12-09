# Day 17: [No Such Thing as Too Much](https://adventofcode.com/2015/day/17)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/17/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/17/part2.pi)*

A neat little puzzle with a simple recursive solution.

## Part 1

Yet again, I figured this would suit a constraint solver, but it turned out to be necessary for part 1 (and probably part 2 as well, but... it worked). It took me a good bit of thinking and experimentation to come up with a correct formulation. At first I made the mistake of assuming each container could be reused an arbitrary number of times, which makes it a more difficult problem. Once I realised my mistake, it simplified things considerably.

## Part 2

This was a neat one. At this point I realised that the choices to use or not use a container could be represented as an array of values in the range 0..1. This made it easy to encode the search for a minimum number of containers as arithmetic constraints and minimise with the `cp` module. With the result found, finding arrangements with this exact number of containers (4 in my case) was as simple as adding a parameter to `calc` which tracks the number of containers that need to be used, reducing it by one when we consume a container.

## Reflections

Another lesson in K.I.S.S. -- it really seems to help to err in favour of simplicity at each juncture, unless the cost of doing it the "smarter" way is almost zero now and high in future (e.g. if part two requires some complicated thing you suspected while working on part one). Even then it's probably quicker to rewrite it later than foresee the correct future now.

## Error collection

None.
