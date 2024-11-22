# Day 21: [RPG Simulator 20XX](https://adventofcode.com/2015/day/21)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/21/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/21/part2.pi)*

## Part 1

Surprisingly straightforward puzzle today, requiring maybe 30 minutes of reading and coding. I pasted the item stats into Neovim and used a macro to translate each line into an array representing the tuple `{Cost, Damage, Armour}`. Then all that was required was to brute-force over all valid combinations of items and keep track of the minimum cost so far.

To account for the possibility of buying zero armour, I added the tuple `{0, 0, 0}`, and two of them when dealing with rings.

## Part 2

I was expecting some sort of planning problem based on minimising cost while buying multiple items and attacking on different turns, or something, but... nope, just replace the minimising step of part 1 with a maximising step. It took less than 100 seconds to make the changes and verify the result.
