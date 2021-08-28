import std/[strutils]

proc muls*(num1,num2: float): float =
    return num1 * num2

proc divs*(num1,num2: float): float =
    return num1 / num2

proc adds*(num1,num2: float): float =
    return num1 + num2

proc subs*(num1,num2: float): float =
    return num1 - num2

proc fmtFloat*(num: float): string =
    var 
     str = $num
     ends = ".0"
    if str.endsWith(ends):
       str.removeSuffix(ends)
       return str
    else:
       return str


