import std/[sugar,times,strutils]
import pkg/[strfmt]

proc bubble_sort[T](collection: seq[T]): seq[T] =
    var list = collection
    var length = len(list)
    for i in 0..<length - 1:
       var swapped = false
       for j in 0..<length - 1 - i:
           if list[j] > list[j + 1]:
              swapped = true
              (list[j],list[j + 1]) = (list[j + 1],list[j])
       if not swapped:
          break
    return list
    
if isMainModule:
  stdout.write "Enters numbers separated by a comma: "
  var user_input = stdin.readline.strip
  var unsorted = collect(newSeq):
      for item in user_input.split(","):
          item.parseInt
         
  var start = times.cpuTime()
  echo "{}".fmt($bubble_sort(unsorted))
  echo "Processing time: {}".fmt(times.cpuTime() - start)
  
