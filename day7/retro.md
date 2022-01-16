# Day 7: [Some Assembly Required](https://adventofcode.com/2015/day/7)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/day7/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/day7/part2.pi)*

This was a pretty fun puzzle that came down to resolving a tree of computations that were defined out-of-order.

## Part 1

I expected that part 2 might get much more complicated, and decided to reach for Picat's inbuilt constraint solver again. Sadly I couldn't figure out a way to convert input dynamically into a map of wire names to constrained values, so I decided to try a tactic someone described to me for day 24 of the 2021 puzzles: convert the input file into a list of constraint expressions that can be understood by Picat. So I made `generator.pi`, which parses the input file and emits a sequence of constraints to be pasted into `day7_cp.pi`, prefixing wire names with `V_` and solving for `V_a` at the end. I was able to reuse my constrained arithmetic implementations of the bitwise operators (after cutting them down to 16 bits).

Unfortunately I'd made a few errors, including the assumption that `AND` would only take two wires as input, but it can take at least an integer on the left-hand side (in my input), and probably other combinations. The generator was pretty dumb so I ended up with constraints like `V_0 #= ...`. This caused a zero to be produced as the final result, which was of course wrong. This took a while to spot, but after fixing the bug, the version using `cp` completed in about 350 ms.

While thinking about that error in the `cp` version, I decided to implement it again and solve it with recursively without the constraint engine. This turned out to be really easy:

1. Parse everything and build a map of wire to tuples of `(Operation,A,B)`.
1. To solve a wire `X`, look up the tuple `(Op,A,B)` for wire `X`, then do the appropriate operation with the results of solving wires `A` and `B`.

At first this solution ran into an apparently infinite loop, which didn't make much sense to me, but by updating the wire map to memoise the results of each lookup (that is, replacing `(Op,A,B)` with `(const,R,0)` when the result `R` has been calculated), the program finished and produced the correct result in about 15 ms.

## Part 2

For both the recursive and CP version, this was as simple as changing or inserting a single line.

## Reflections

Writing a transpiler from custom input to constraint expressions can be a viable solution to some problems, although error-checking becomes a lot more difficult, as in the `V_0` case where a constant was treated as a variable.

Also, the constraint solver is often overkill -- I did this for fun, but it would have been quicker to just start with the recursive solution.

## Mystery errors

```
*** error(type_error(integer,[x]),index_operator [])
```

```
*** error(instantiation_error,/\ /2)
```

This one was pretty confusing without a line number or stack trace.
