import std/[sugar,strutils]

proc comp_and_swap(list: var seq[int],idx1,idx2,dir: int): void =
    if dir == 1 and list[idx1] > list[idx2] or
       dir == 0 and list[idx1] < list[idx2]:
       (list[idx1], list[idx2]) = (list[idx2],list[idx1])

proc bitonic_merge(list: var seq[int],low,length,dir: int): void =
    if length > 1:
      var mid = int(length / 2)
      for i in low..<low + mid:
         comp_and_swap(list,i,i + mid,dir)
      bitonic_merge(list,low,mid,dir)
      bitonic_merge(list,low + mid,mid,dir)

proc bitonic_sort(list: var seq[int],low,length,dir: int): void =
   if length > 1:
     var mid = int(length / 2)
     bitonic_sort(list,low,mid,0)
     bitonic_sort(list,low + mid,mid,1)
     bitonic_merge(list,low,length,dir)

if isMainModule:
  stdout.write "Enter numbers separated by a comma: "
  var user_input = stdin.readline
  var unsorted = collect(newSeq):
      for item in user_input.split(","):
         item.strip.parseInt
         
  bitonic_sort(unsorted,0,len(unsorted),1)
  echo "Sorted list in ascending order is: "
  echo $unsorted

  bitonic_merge(unsorted,0,len(unsorted),0)
  echo "Sorted list in descending order is: "
  echo $unsorted
