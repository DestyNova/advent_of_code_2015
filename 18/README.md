# Day 18: [Like a GIF For Your Yard](https://adventofcode.com/2015/day/18)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/18/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/18/part2.pi)*

Classic Advent of Code: Game of Lights/Life

## Part 1

This one was pretty straightforward, having done a couple of very similar ones in later years. Eric Wastl seems to have a fondness for cellular automata and Conway's Game of Life, and I can see why.

It didn't take too long to produce the correct answer for the sample input, but when I ran it on the full input the answer was too low. I took a few minutes to pour another cup of tea before looking at the code again, then noticed I hadn't changed the number of iterations from 4 to the requisite 100. Oops. Moving on...

## Part 2

This one was a trivial update to part 1. If I'd been doing this in Haskell, as in 2020 and 2021, it would have required a bit of awkwardness in the neighbour-counting code, but since Picat happily allows mutating updates with the `:=` operator, all that was required was to set the corner lights on at the beginning of each iteration.

I also set them at the end to make sure the final count is correct. This was a tiny bit wasteful since they only needed updating on the last iteration, but... there are probably much more wasteful things in the program. Although I suspected that determining the dimensions of the grid on each input step was really inefficient, I just checked the impact of calculating `W` and `H` outside the `update` function and passing them down, but it makes literally no difference whatsoever. Picat's arrays are really efficient.

## Reflections

Upon getting the wrong result in part 1, I started to worry that there was an infinitely-growing grid situation, which I think happened in one of the 2021 problems. But then I remembered not to jump to conclusions that the problem is more complex than it seems -- better check the simple, obvious things first. And indeed, I'd just forgotten to update the iteration count. Also the text did specify it was a 100x100 grid and that neighbours of the edge lights were always off. Anyway, I'm learnding!

## Error collection

None.
