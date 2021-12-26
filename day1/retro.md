# Day 1: [Not Quite Lisp](https://adventofcode.com/2015/day/1)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day1/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day1/part2.pi)

An easy puzzle to start the 2015 challenges.

## Part 1

Where I realise that I still don't know much about Picat's syntax or standard library. Reading and parsing input will probably be awkward for a while.

## Part 2

This was easy but I was returning the wrong value (the position, which I cleverly named `C`, rather than the count within the string, which I cleverly named `P`). I also had some sort of off-by-one error that terminated the search when we were actually at -2 or something.

## Reflections

I'm looking forward to learning more about Picat. One thing that sucks is that most errors don't seem to produce any stack traces. Instead, you just get output like:

```
$ picat main.pi < sample.txt
*** error(failed,main/0)


$ picat main.pi < sample.txt
** Error  : invalid_subgoal:1
1 error(s)
*** error(syntax_error,picat)


$ picat main.pi < sample.txt
** Error  : predicate_used_as_function:count_moves / 2
1 error(s)
*** error(syntax_error,picat)


$ echo -n '(())' | picat part2.pi
*** Undefined procedure: throw/1
```

Maybe there's some command-line flags that could help with this, or maybe it's just a limitation of Picat.
