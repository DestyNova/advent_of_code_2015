# Day 9: [All in a Single Night](https://adventofcode.com/2015/day/9)
*Picat: [Both parts](https://github.com/DestyNova/advent_of_code_2015/blob/main/day9/main.pi) (only one line change)*

A neat variation on the Hamiltonian circuit problem, where we don't care about the start and end points.

## Part 1

Picat has some really good builtins for finding a Hamiltonian circuit with the built-in constraint solvers, so I spent a bit of time looking into this. However either I've misunderstood the docs, or it is limited to a full circuit (i.e. visits all nodes and returns to the start node).

I eventually decided to try to manually encode the problem and teach the constraint solver what I was looking for. It turned out to be really easy to state, except for the actual lookup of the `{From, To}` vertex pair in the costs table. I found an example of solving TSP in the [Picat constraint solving book](http://picat-lang.org/picatbook2015/constraint_solving_and_planning_with_picat.pdf) page 124 which used a 2D costs table, but didn't quite understand why it was selecting one row of the table at a time. What I wanted was to take a pair of successive nodes (in the `Vars` list) as `From` and `To`, then look up the cost in a 2D table with something like `element(To, E[From], Costs[I])`, but it doesn't like me using a domain variable (`From`) to index into `E` at that point.

Instead, I flattened the costs table into a 1D array with the usual formula of `(J-1)*NumVertices + I`, and this worked like a treat, producing an optimal answer in about 20 milliseconds.

## Part 2

Thanks to Picat's flexibility and expressive built-ins, I was able to just swap out the optimisation objective `$min(TotalCost)` for `$max(TotalCost)`, producing the correct part 2 answer in one of my lowest splits ever (21 seconds).

## Reflections

Picat is made for this type of problem, and it felt great to use it even though I didn't know how to express the problem properly at first.

## Error collection

No confusing errors this time. Guess I'm getting used to parsing them.
