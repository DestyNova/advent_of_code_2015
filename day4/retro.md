# Slightly awkward errors

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
