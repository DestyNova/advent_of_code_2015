# Day 19: [Medicine for Rudolph](https://adventofcode.com/2015/day/19)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/19/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/19/part2.pi)*

Exploding string replacements.

## Part 1


## Part 2


## Reflections

## Error collection

I was getting "nonvariable_expected" and really weird return values from the `expand` function. `R` was a list of strings before the return, but then it appeared as a variable to the caller (`main`). It turned out I'd left out an `end` to one of the `foreach` blocks in `expand`. This is really, really unintuitive and should definitely produce some kind of parse error since the AST is clearly incomplete.
