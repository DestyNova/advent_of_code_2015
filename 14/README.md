# Day 14: [Reindeer Olympics](https://adventofcode.com/2015/day/14)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/14/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/14/part2.pi)*

Easy simulation.

## Part 1

This part was doable with simple arithmetic. Parsing was pretty easy thanks to Picat's pattern-matching support.

## Part 2

I got stuck for quite a while on this one, with really weird effects where my recursive scoring function seemed to receive extra mystery executions. After a while I had to go out for a while to drop kids to school. When I got back, a bit of investigation suggested that calling the scoring function `go` was a bad idea because it seems to be treated as a special function in Picat. Although after tidying up the program, I can't replicate the problem anymore. Weird...

## Reflections

Not sure what to make of this one...

## Error collection

None.
