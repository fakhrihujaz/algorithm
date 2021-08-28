import std/[strutils,sugar]

proc shaker_sort(list: seq[int]): seq[int] =
    var unsorted = list
    for i in countdown(unsorted.len - 1,1):
        var swapped = false
        for j in countdown(i,1):
            if unsorted[j] < unsorted[j - 1]:
               (unsorted[j],unsorted[j - 1]) = (unsorted[j - 1],unsorted[j])
               swapped = true
        for j in 0..<i:
            if unsorted[j] > unsorted[j + 1]:
               (unsorted[j],unsorted[j + 1]) = (unsorted[j + 1],unsorted[j])
               swapped = true
        if not swapped:
           break
    return unsorted

if isMainModule:
   stdout.write "Enter numbers separated by a comma: "
   var user_input = stdin.readline
   var unsorted = collect(newSeq):
       for item in user_input.split(","):
           item.parseInt
   echo $shaker_sort(unsorted)
