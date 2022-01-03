# Day 8: [Matchsticks](https://adventofcode.com/2015/day/8)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day8/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day8/part2.pi)

A simple counting puzzle.

## Part 1

This one went okay, but I found Picat's pattern matching a bit limited when it came to partial string matching. I wanted to match hex code literals a function head like this:

```picat
solve([("\\x" ++ [_,_] ++ X)|XS],C,L) = solve([X|XS],C+4,L+1).
```

Picat didn't like this, and I had to go with nested list constructors instead, making things uglier:

```picat
solve([['\\'|['x'|[_|[_|X]]]] | XS], C, L) = solve([X|XS],C+4,L+1).
```

Maybe there's a nicer way to express this that I'll discover later.

## Part 2

Easier than part 1.

## Reflections

* Picat could do with nicer string utilities (e.g. a `starts_with` or `contains` function, like Haskell's `isPrefixOf` and `isInfixOf`, rather than having to either futz with `find` or awkward pattern matching.

## Error collection

```
*** error until line 11
'|X]]|XS], C, L) = solve(X,C+2,L+1).
```

(Syntax error, but what is the message trying to say? I think this one came down to my failing to escape a quote in a character literal.)
