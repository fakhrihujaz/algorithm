import std/[strutils]

proc evaluate_postfix(notation: seq[string]): int =
    echo $notation
    if notation.len == 0:
       return 0
    var operations = ["+", "-", "*", "/"]
    var stack: seq[int] = @[]
    for token in notation:
      if token in operations:
         var(b,a) = (stack.pop,stack.pop)
         if token == "+": 
              stack.add(a + b)
              echo $stack
         elif token ==  "-":
              stack.add(a - b)
              echo $stack
         elif token == "*":
              stack.add(a * b)
              echo $stack
         else:
            if a * b < 0 and a mod b != 0:
               stack.add(a div b + 1)
               echo $stack
            else:
               stack.add(a div b)
               echo $stack
      else:
        stack.add(parseInt(token))
        echo $stack
        
    return stack.pop()

if isMainModule:
   echo $evaluate_postfix(@["2", "1", "+", "3", "*"])
   echo $evaluate_postfix(@["4", "13", "5", "/", "+"])
   echo $evaluate_postfix(newSeq[string]())
