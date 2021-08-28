import std/[enumerate,sugar,strutils,strformat]

proc insertion_sort(collect: var seq[int]): seq[int] =
     var 
      temp,index = 0
     for insert,value in enumerate(collect[1..^1]):
        index = insert; temp = index
        while index >= 0 and value < collect[index]:
             collect[index + 1] = collect[index]
             index -= 1
        if index != temp:
          collect[index + 1] = value
     return collect

if isMainModule:
  stdout.write("insert number separated by comma: ")
  var 
    user_input = stdin.readLine()
    unsorted = collect(newSeq):
     for item in user_input.split(","):
         item.parseInt()
  echo fmt"{insertion_sort(unsorted)}"
