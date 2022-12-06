# Day 6: [Probably a Fire Hazard](https://adventofcode.com/2015/day/6)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day6/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day6/part2.pi)*

Another fairly easy puzzle that's amenable to an imperative-style solution.

## Part 1

No major problems here, although it's still not clear how best to parse complicated text input. Something like Parsec, or Rust's [scan_fmt](https://docs.rs/scan_fmt/latest/scan_fmt) would be sweet. I'm getting a little quicker debugging with some of Picat's less informative error messages:

```
*** error(failed,main/0)
```

In this case I think it was a partial function that failed to match on its arguments. It would probably be more helpful for Picat to report which function it was trying to call, from where.

## Part 2

A small step beyond part 1, nothing scary.
