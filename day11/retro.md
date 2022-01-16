# Day 11: [Corporate Policy](https://adventofcode.com/2015/day/11)
*Picat: [Both parts](https://github.com/DestyNova/advent_of_code_2015/blob/main/day11/main.pi) (part 2 is just a different input)*

Find the next valid password according to Santa's corporate password policy scheme.

## Part 1

This one was pretty straightforward, but I decided to use Picat's constraint solver again just for fun. It made sense to represent the passwords as a list of 8 integers representing a base-26 number (although I actually excluded zeroes because `aa` would be equivalent to `a` in that case, so the domain was from `1..26`).

It took a while to figure out how to represent the constraint that "at least one of these cases is true" for incrementing runs and pairs, but the trick that's worked before and worked again this time is to make an array or list to hold intermediate results and do something with the list afterwards. In this case, I made the lists hold the output of a 0/1-valued `cond` expression, then specified constraints on the sums of those lists.
There might be a more elegant way to do this in Picat, but this was the only way I could think of to express it, other than manually specifiying every possibility (doable in this case of a small 8 character input, but... nah).

## Part 2

This one was the same as part 1 but taking the output of that part as the new input. I'm not sure if this would have thrown off a naieve brute-force searcher, but I doubt it since the part 2 result was only about 12 million greater (in base 26), so it would seem that both parts could have been solved by stepping forward through all possible passwords starting at the initial input until the conditions are met.

## Reflections

No problems really. It would be nice if there were some built-in helpers in Picat for the runs and non-overlapping pairs tests. There are `increasing` and `strict_increasing` predicates, but how would you say "at least N in a row of these variables should be sequential"?

## Error collection

None.
