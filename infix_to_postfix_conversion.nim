import std/[tables,strutils]
import stack,balanced_parenthesis

proc precedence(ch: string): int =
   return { "+": 1, "-": 1, "*": 2, "/": 2, "^": 3}.toTable().getOrDefault(ch, -1)


proc infix_to_postfix(expression_str: string): string =
   if not balanced_parentheses(expression_str):
      raise newException(ValueError,"Mismatched parenthesis")
   
   var stack = newStack[char]()
   var postfix: seq[char] = @[]
   for ch in expression_str:
      if ch.isAlphaAscii() or ch.isdigit():
         postfix.add(ch)
      elif ch == '(':
         stack.push(ch)
      elif ch == ')':
         while not stack.is_empty() and stack.peek() != '(':
               postfix.add(stack.pop())
         discard stack.pop()
      else:
         while not stack.is_empty() and precedence($ch) <= precedence($stack.peek()):
               postfix.add(stack.pop())
         stack.push(ch)
   while not stack.is_empty():
        postfix.add(stack.pop())
   return postfix.join(" ")


if isMainModule:
  var expression = "a+b*c+(d*e+f)*g"
  echo "Infix to Postfix Notation demonstration: "
  echo "Infix notation: " & expression
  echo "Postfix notation: " & infix_to_postfix(expression)
