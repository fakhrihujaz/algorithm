import std/[random,sugar,strutils]
import pkg/[strfmt]

proc bogo_sort(collection: var seq[int]): seq[int] =

    proc is_sorted(collection: seq[int]): bool =
       if len(collection) < 2:
          return true
       for i in 0..<len(collection) - 1:
         if collection[i] > collection[i + 1]:
            return false
       return true

    if not is_sorted(collection):
       random.shuffle(collection)

    return collection
    
if isMainModule:
  stdout.write "Enter numbers separated by a comma: "
  var user_input = stdin.readline.strip
  var unsorted = collect(newSeq):
     for item in user_input.split(","):
        item.parseInt
  var count = 0
  while true:
     var sorted = bogo_sort(unsorted)
     if sorted == @[0,2,2,3,5]:
        echo "Correct sorted: {} in {} tries".fmt($sorted,$count)
        break
     inc count

    
