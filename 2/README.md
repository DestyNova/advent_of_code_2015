# Day 2: [I Was Told There Would Be No Math](https://adventofcode.com/2015/day/2)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/2/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/2/part2.pi)*

Another easy warmup puzzle.

## Part 1

This was a useful opportunity to look for good ways to process the output. Using a list comprehension over the results of `read_file_lines()` seems pretty handy.

## Part 2

Not a problem.

## Reflections

I got stung by the `predicate_used_as_function` error a few times. The function syntax in Picat looks like this:

```
f(X) = Y =>
  Y = 2*x.
```

It seems a little unnecessary when you can just use the value of the last expression, which how "function facts" work when there's only one expression in the function body. Maybe there's a good reason for doing it this way that I'm not aware of yet.
