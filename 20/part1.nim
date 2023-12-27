import strformat,strutils

let
  n = stdin.readAll.parseInt
  l = n div 10

var houses = newSeq[int](l+1)

for elf in 1..l:
  var house = elf
  while house < l:
    houses[house] += elf * 10
    house += elf # the further we go, the fewer steps needed: O(N*log(N)) rather than O(N*N)

for i in 1..l:
  if houses[i] >= n:
    echo i
    break
