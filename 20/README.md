# Day 20: [Infinite Elves and Infinite Houses](https://adventofcode.com/2015/day/20)
*Picat: [Part 1](https://github.com/DestyNova/advent_of_code_2015/blob/main/20/part1.pi), [Part 2](https://github.com/DestyNova/advent_of_code_2015/blob/main/20/part2.pi)*

Factors.

## Part 1

I initially tried solving this with Picat's SAT solver, and had some success with the `cp` module, but only for counting one house's presents at a time. I got the right answer but it took like 2 hours.

It was so bad I deleted the code, replacing it with a much better Nim version after finishing part 2. The Nim implementation takes around 310 ms, using the same much more efficient method I used in part 2.

## Part 2

This time part 2 was pretty much the same as part 1 but with a slight twist that would require more iterations if I used the approach from part 1.

Instead, I cheated and watched a [video by 0xdf](https://youtu.be/ji7jyPjyLwU) showing a much better way of doing it: my original version was something like this:

```
for every house H
  for every elf E in 1..H
    if H mod E == 0 and H // E <= 50:
        add 11*(H // E) to Presents[H]
```

This is effectively $$O(n**2)$$ time complexity, which for the size of this problem results in up to 9 trillion iterations of the inner loop. This isn't beyond the realms of brute-force, but the approach shown in the video is much better since the inner loop steps forward in increments equal to the current elf number. Adding a couple of counters showed that it found the answer for part two with only about 15 iterations of the inner loop per outer loop cycle on average, and since `log2(3000000)` is just under 15, the time complexity of this version looks like $$O(N{log2}(n))$$ -- much more tractable.

## Reflections

I wasted a lot of time trying to shoehorn this problem into the CP/SAT solver, which is always tempting with Picat. Then I tried to formulate it as a factor-finding problem. In the end though, the simple imperative solution turned out to be much, much faster -- around 850 ms for the Picat version of part 2, and an impressive 90 ms for the Nim version (which is also shorter in this case thanks to Nim's relatively concise whitespace-significant syntax).
