import std/[strutils,tables,algorithm]

proc infix_2_postfix(Infix: string): string =
    var Stack,Postfix: seq[char] = @[]
    var priority = {
        '^': 3,
        '*': 2,
        '/': 2,
        '%': 2,
        '+': 1,
        '-': 1,
    }.toTable()
    var width = if len(Infix) > 7: len(Infix) else: 7
    var head = ""
    for x in items(["Symbol".center(8),
                "Stack".center(width),
                "Postfix".center(width)]):
        addSep(head,sep = " | ", startLen = len(""))
        add(head,x)
    echo $head
    echo $repeat('-',width * 3 + 7)
    for x in Infix:
       if x.isalphaAscii() or x.isdigit():
          Postfix.add(x)
       elif x == '(':
          Stack.add(x)
       elif x == ')':
          while Stack[^1] != '(':
              Postfix.add(Stack.pop())
          discard Stack.pop()
       else:
          if Stack.len == 0:
             Stack.add(x)
          else:
             while Stack.len > 0 and priority[x] <= priority[Stack[^1]]:
                  Postfix.add(Stack.pop())
             Stack.add(x)
       var body = ""
       for str in [center($x,8),
                   alignLeft(join(Stack,""),width),
                   alignLeft(join(Postfix,""),width)]:
           addSep(body,sep = " | ", startLen = len(""))
           add(body,str)
       echo $body
    while Stack.len > 0:
        Postfix.add(Stack.pop())
        var body = ""
        for str in [center(" ",8),
                    alignLeft(join(Stack,""),width),
                    alignLeft(join(Postfix,""),width)]:
            addSep(body,sep = " | ", startLen = len(""))
            add(body,str)
        echo $body
    return join(Postfix,"")
    
proc infix_2_prefix(infix: string): string =
     var Infix = infix.reversed()
     for i in 0..<Infix.len:
        if Infix[i] == '(':
           Infix[i] = ')'
        elif Infix[i] == ')':
             Infix[i] = '('
     var postfix = infix_2_postfix(join(Infix,""))
     postfix.reverse()
     return postfix

if isMainModule:
  stdout.write "\nEnter an Infix Equation = "
  var Infix = stdin.readLine
  Infix = join(Infix.split(),"")
  echo "\n\t", Infix,"(Infix) -> ", infix_2_prefix(Infix),"(Postfix)"
