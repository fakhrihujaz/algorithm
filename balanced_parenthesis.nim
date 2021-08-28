import stack
import std/[tables]
import pkg/[strfmt]

proc balanced_parentheses*(parentheses: string): bool =
    var stack = newStack[string]()
    var bracket_pairs = {"(": ")","[": "]","{": "}"}.toTable()
    for bracket in parentheses:
       if bracket_pairs.hasKey($bracket):
          stack.push($bracket)
       elif $bracket in [")","]","}"]:
           if stack.is_empty() or 
              bracket_pairs[stack.pop()] != $bracket:
              return false
    return stack.is_empty()
       
if isMainModule:
   var examples = @["((()))", "((())", "(()))"]
   echo "Balanced parentheses demonstration: "
   for example in examples:
      var not_str = if balanced_parentheses($example): "" else: "not "
      echo "{} is {}balanced".fmt(example,not_str)
   
