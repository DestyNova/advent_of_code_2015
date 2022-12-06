# Day 12: [JSAbacusFramework.io](https://adventofcode.com/2015/day/12)
*Picat: [Both parts](https://github.com/DestyNova/advent_of_code_2015/blob/main/day12/main.pi) (part 2 is a small restriction on part 1)*

Sum integers in JSON (with lists and atoms as input, as well as complete JSON objects).

## Part 1

This was made a bit more difficult by the fact that Picat's standard library doesn't contain a JSON parser. At first I started writing one, but realised someone else probably did it already. Sure enough I found Neng-Fa Zhou (creator of Picat) had improved and shared a parser based on an old unmaintained [parser by "mbionchi"](https://github.com/mbionchi/json-picat). There was no license but when I opened an issue, Neng-Fa quickly responded that the code can be considered public domain and free to use.

And it worked just fine -- I had to make a small alteration to make some of the private functions not private, since the public interface expects to work directly with streams or files. I don't know how streams are represented in Picat, but it might just be an atom representing `stdin` or similar. There doesn't seem to be a way to treat a string as a stream, so the private `json_to_picat` functions need to be called directly when working with strings.

Apart from that it was alright except that I ran into another surprising issue. Surprising to me, at least. Consider the following program:

```picat
main =>
  f(123,R),
  println(r=R).

f(X,R) =>
  R = 0,
  R := X.
```

In this scenario, I expected `r = 123` to be printed, but we actually get `r = 0`. Somehow the destructive update to `R` don't actually affect the "true" value of `R`. Afterwards, I checked the [Picat user's guide](http://picat-lang.org/download/picat_guide.pdf) and found something that seems to explain the behaviour:

```
Example: test => X=0, X:=X+1, X:=X+2, write(X).

In order to handle assignments, Picat creates new variables at compile time. In the above
example, at compile time, Picat creates a new variable, say X1, to hold the value of X after the
assignment X:=X+1. Picat replaces X by X1 on the LHS of the assignment. It also replaces all of
the occurrences of X to the right of the assignment by X1. When encountering X1:=X1+2, Picat
creates another new variable, say X2, to hold the value of X1 after the assignment, and replaces
the remaining occurrences of X1 by X2. When write(X2) is executed, the value held in X2,
which is 3, is printed. This means that the compiler rewrites the above example as follows:

test => X=0, X1=X+1, X2=X1+2, write(X2).
```

So it seems that mutating assignments in Picat are a new definition that shadows the old one. Maybe. Anyway, to handle this properly, I wrote to a temporary variable until the end of the function, then set `R` to take the value of the updated result:

```picat
f(X,R) =>
  T = 0,
  T := X,
  R = T.
```

## Part 2

This part was very straightforward and just required a conditional check in the case where we handle a map.

## Reflections

Not really. Maybe I need to spend more time reading the manual though, but... I probably won't remember the details anyway -- the knowledge seems to stick better if I discover it as part of solving problems like these.

## Error collection

None.
