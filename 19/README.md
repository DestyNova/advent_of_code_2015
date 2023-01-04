# Day 19: [Medicine for Rudolph](https://adventofcode.com/2015/day/19)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/19/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/19/part2.pi)*

Exploding string replacements.

## Part 1

This part was reasonable enough, although the explosion of new strings is a bit of a headwreck.

## Part 2

It got really difficult here. I tried using Picat's planner to search for an optimal solution, but it runs for ages and then exhausts RAM with either the set of states it's tracking, or the tabled results of calling `expand` with many different arguments (which is quite important because calling it without DP takes about 5 seconds on the 506-character input string). Actually I should rename it to "shrink" and probably will.
After a while, I realised it might make more sense to invert the dictionary and perform the replacements backwards, trying to go from the input string to the starting "e". This worked on the sample data, but the full input was still too much. Later, I added a heuristic eval function to try to guide the search, but it doesn't help much either.
Then I implemented a greedy backtracker and it solves the simple problems but just can't make progress on the full input.

Eventually I searched for some hints and found someone else had gotten the whole thing done with a single greedy pass, suggesting that the input is carefully constructed to allow this. But it doesn't work for me -- I get stuck with the string "NRnBSiRnCaRnFArYFArFArF" after 201 steps, and no further reductions are possible. Hmm... I don't get it. After tweaking the backtracking version a bit so that it (hopefully) checks the greediest possibility first, it ploughs ahead until reaching the same point, then gets stuck wandering between steps 180-200 for about 10 minutes, then runs out of memory. Not good. I think the author whose blog post I was reading may have gotten lucky with his input, because there doesn't seem to be one obvious greedy path here.

**Update 2023-01-04 02:45:** Well, tweaking the heuristic in a very dodgy way allowed it to greedily run to completion. I found [another writeup](https://www.reddit.com/r/adventofcode/comments/3xflz8/comment/cy4etju/) which really cleverly reverse-engineered the problem, which apparently only has _one_ possible solution, so there's no point continuing the search after (if) it finds a solution. With that in mind, I swapped out `best_plan` for `plan` and it finished (for some heuristic settings) after about 4 minutes. Think I'll try the clever solution tomorrow, which seems like it shouldn't require _any_ expansion/shrink steps, and should therefore finish in a few milliseconds! Wow. I like the idea of a generic search / optimisation system finding its way to the correct solution without heavy guidance from the programmer, but at the same time it's pretty cool to have that be purposely strewn with red herrings so that the only solution is to sit down and analyse the input data.

**Update 2023-01-04 17:20:** I took a few minutes to read and understand [askalski's excellent writeup](https://www.reddit.com/r/adventofcode/comments/3xflz8/comment/cy4etju/), and was able to implement his solution in a few lines of Picat, producing the right answer in 12 milliseconds, providing a speed boost of at least 20000x over my flakey graph search solution. Not bad.

## Reflections

## Error collection

I was getting "nonvariable_expected" and really weird return values from the `expand` function. `R` was a list of strings before the return, but then it appeared as a variable to the caller (`main`). It turned out I'd left out an `end` to one of the `foreach` blocks in `expand`. This is really, really unintuitive and should definitely produce some kind of parse error since the AST is clearly incomplete.
