# Day 10: [Elves Look, Elves Say](https://adventofcode.com/2015/day/10)
*Picat: [Both parts](https://github.com/DestyNova/advent_of_code_2015/blob/main/10/main.pi) (only a single digit needs to change)*

Count the length of the look and say sequence iterated N times over a given input.

## Part 1

I'd read about this sequence before and remembered that it grew exponentially, so I figured part 2 might be something like "now iterate 10,000 times", requiring a solution that doesn't take linear space.
But I also remembered that only the digits 1, 2 and 3 appear in the sequence (unless the input string contains other digits), which means a sort of run-length encoded representation (which is really what the sequence produces) would be useless. So I tried the simple implementation, using pattern matching on the input string to check first for a run of 3 identical characters, then 2, then 1.

This worked just fine for 40 iterations.

## Part 2

...And it also looked perfectly fine, requiring 1.7 seconds compared to the 50ms or so needed by part 1. I could have easily beaten my record for fastest split, but I wasted a few seconds staring at the console.

## Reflections

Another nice one for Picat, only let down a little by the syntax for pattern matching successive list elements. Haskell lets you do something like `a:b:c:d:xs` rather than Picat's `[A|[A|[A|[A[Xs]]]]]`, but on the other hand, the trick of using the variable `A` in multiple parts of the pattern is not legal in Haskell, so you have to add a guard: ` | a == b && a == c && ...`.

## Error collection

None.
