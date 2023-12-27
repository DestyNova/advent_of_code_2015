import strformat,strutils

let
  n = stdin.readAll.parseInt
  l = n div 11

var
  houses = newSeq[int](l+1)

for elf in 1..l:
  var house = elf
  while house < l and house div elf <= 50:
    houses[house] += elf * 11
    house += elf

for i in 1..l:
  if houses[i] >= n:
    echo i
    break
