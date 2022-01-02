# Day 5: [Doesn't He Have Intern-Elves For This?](https://adventofcode.com/2015/day/5)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day5/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day5/part2.pi)

Another fairly easy puzzle, this time involving string patterns.

## Part 1

I wasted a bit of time looking for a Picat equivalent of Haskell's `isInfixOf` function to check for partial string matches. The closest I could find was `find(String, Substring, _Start_pos, _End_pos)`.

Then I ran into some strange parsing errors while trying to specify the three predicates:

```
** Error  : Wrong function in expression: _039d0'=''$var'(_a788,_a790,_a798,_a7a0,_a7a8,_a7b0,_a7b8,_a7c0)
1 error(s)
*** error(syntax_error,picat)
```

Caused by the following line:

```
  P1 = length(findall(Y, (member(Y, "aeiou") && member(Y, X)))) >= 3,
```

For some reason I needed to wrap the entire RHS in parentheses.

Another similar parsing error caught me out with the `cond(...)` expression:

```
Picat> println(cond(2 > 1 && 1 < 2, 1, 0))
*** SYNTAX ERROR *** (0-1) wrong expression.
println(cond(2 > 1  <<HERE>> 
                   && 1 < 2, 1, 0))


Picat> println(cond((2 > 1 && 1 < 2), 1, 0))
1
```

Hopefully I'll remember this one.

## Part 2

This wasn't a big deal and the new predicates were easily formulated as a couple of tail-recursive functions.
