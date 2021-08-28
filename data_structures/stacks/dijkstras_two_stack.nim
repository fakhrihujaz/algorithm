import stack, operator as op
import std/[tables,strutils]
import pkg/[strfmt]

proc dijkstras_two_stack(equation: string): float =
   var operators = {
       '*': op.muls,
       '/': op.divs,
       '+': op.adds,
       '-': op.subs
   }.toTable()
   var operand = newStack[float]()
   var operator = newStack[char]()

   for i in equation:
       if i.isdigit():
          operand.push(parseFloat($i))
       elif operators.hasKey(i):
          operator.push(i)
       elif i == ')':
          var opt = operator.peek()
          discard operator.pop
          var num1 = operand.peek()
          discard operand.pop
          var num2 = operand.peek()
          discard operand.pop
          var total = operators[opt](num1,num2)
          operand.push(total)
   return operand.peek()

if isMainModule:
   var equation = "(5 + ((4 * 2) * (2 + 3)))"
   echo "{} = {}".fmt(equation,fmtFloat(dijkstras_two_stack(equation)))

