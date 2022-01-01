# Day 4: [The Ideal Stocking Stuffer](https://adventofcode.com/2015/day/4)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day4/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day4/part2.pi)

A very easy puzzle that can be brute-forced quickly.

## Part 1

The obvious approach to both parts of the puzzle is to run a bruteforce search for the smallest number `N` which, when appended to the input string `S` and hashed with MD5 produces an output beginning with five zeroes.

Unfortunately Picat doesn't come with an MD5 function in the standard library, so I wrote one based on a naieve copy of the [pseudocode in Wikipedia's MD5 article](https://en.wikipedia.org/wiki/MD5#Pseudocode) and some of the implementations on [Rosetta Code](https://rosettacode.org/wiki/MD5/Implementation#Lua).

This went relatively quickly and I had a working MD5 function. The obvious thing to do now was to try a bruteforce attack starting with `N=1` and running until a match is found. But I really wanted to try solving it more intelligently with Picat's constraint solvers, so I spent several days coming up with a version that works without mutating updates (by writing new values to fresh slots in a list rather than updating the same value), and replacing all the bitwise operations with versions the only use the basic arithmetic functions supported by Picat's constraint system.

Eventually, I got this running and producing the correct answers, but it only seems to make any noticeable progress with the GLPK mixed-integer solver. Even then, it's extremely slow, and I'm not sure if it's due to my formulation of the problem, insufficient domain constraints or some other issue. Before getting to this point I spoke to Hakan Kjellerstrand who suggested treating the input as a list of boolean bits, since he has some [example code](http://hakank.org/picat/bitwise.pi) for doing constrained bitwise operations in this format. I stuck with a list of integers representing byte values because that seemed simpler, but it may have been the wrong choice.

## Part 2

This required almost no changes from part 1, just checking for a match with `"000000"` at the beginning rather than `"00000"`. I figured this would be impractical, but it completed in 6m 17s using my fairly naieve Picat implementation of MD5. I imagine this would only take a few seconds in Rust.

# Reflections

## Sometimes bruteforcing is the safer approach

SAT/SMT/MIP solvers are magical but they aren't always the right tool. If you can bruteforce the answer in a couple of minutes, you should probably do that rather than spending hours or days converting the problem for SAT/MIP/SMT solvers.

## More Picat errors

Here are some of the more confusing errors I ran into while working on this. Again, most of these didn't produce any line numbers, so it was hard to localise the problem:

```
*** error(type_error(list,[a,b,c,d,e,f|]),length)
```

Caused by `"abcdef" ++ chr(0x80)` (should have appended `[chr(0x80)]`)

```
*** error(type_error(evaluable,a/0),* /2)
```

```
*** error(integer_expected([1635778560]),to_radix_string)
```

```
*** error(instantiation_error,> /2)
```

No clue. The operator `>` isn't used anywhere in the program.

```
*** error(type_error(evaluable,length/1),(-)/2)
```
