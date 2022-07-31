# Day 3: [Perfectly Spherical Houses in a Vacuum](https://adventofcode.com/2015/day/3)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day3/part1.pi) (00:27), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day3/part2.pi) (00:28)*

Another easy warmup puzzle.

## Part 1

Another chance to learn some basic structures and operations in Picat -- this time, dealing with hashmaps which turns out to be super easy. Picat has an overloaded `get` function for maps: `get(M, K)` requests the value in map `M` with key `K`, and `get(M, K, 0)` returns the value with key `K` if it exists, or the default value `0` if that key doesn't exist.

## Part 2

At first I thought about making separate functions for updating each Santa position, but then realised I could just pass both coordinates to the same function and swap them on each recursive call, meaning Santa would be processed first, then Robo-Santa, then Santa again, and so on.

## Reflections

The dynamic nature of Picat and Prolog means it's sometimes not immediately obvious what you've done wrong. Consider this error I encountered in part 1:

```
*** unresolved_function_call(update_pos(^,$hshtb(1,hashtable(_288,[(0,0)=1|_2d0],_2d8,_2e0,_2e8,_2f0,_2f8,_300,_308,_310,_318))))
```

As usual there's a lack of line numbering in the error message, which is weird because it sometimes does produce line numbers and even highlights the point where it encountered a problem in the expression. Anyway, in this case the problem was that I'd mixed up the arguments `M` and `P` in the arguments to `solve`, so it was receiving a hashmap for `P` and a coordinate tuple for `P` when it should have been the other way around. A statically typed language would spot this mistake at compile time and inform you before allowing the program to run. Although I've seen some type error messages in Haskell that were almost incomprehensible to me, they're generally a net win in terms of understanding the mistake sooner rather than later.

It'd be interesting to look at the statically-typed Prolog derivative [Mercury](https://mercurylang.org) at some point, which combines some of the magic available to Picat with very rigorous static typing. When I took a quick look at it before though, it felt like there was a lot of "noise" overhead from the type declarations that were required even for the simplest "Hello, world!" program. It also probably doesn't have a puzzle-solving kitchen sink standard library like Picat does.
