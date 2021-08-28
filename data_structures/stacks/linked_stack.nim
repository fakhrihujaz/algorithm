import std/[sugar,strutils]

type
  Node*[T] = ref object
     data*: T
     next*: Node[T]

type
  LinkedStack*[T] = ref object
     top: Node[T]

iterator iter*[T](self: LinkedStack[T]): T =
    var node = self.top
    while node != nil:
        yield node.data
        node = node.next

proc str*[T](self: LinkedStack[T]): string =
    var data = collect(newSeq):
        for item in self.iter:
            item
    return join(data,"->")
    
proc len*[T](self: LinkedStack[T]): int =
     var data = collect(newSeq):
         for item in self.iter:
             item
     return data.len

proc is_empty*[T](self: LinkedStack[T]): bool =
     return self.top.isNil

proc push*[T](self: LinkedStack[T],item: T) =
     var node = Node[T](data: item)
     if not self.is_empty():
        node.next = self.top
     self.top = node

proc pop*[T](self: LinkedStack[T]): T =
    if self.is_empty():
      raise newException(IndexDefect,"pop from empty stack")
    var pop_node = self.top
    self.top = self.top.next
    return pop_node.data

proc peek*[T](self: LinkedStack[T]): T =
    if self.is_empty():
      raise newException(IndexDefect,"peek from empty stack")
    return self.top.data

proc clear*[T](self: LinkedStack[T]) = self.top = nil
    
if isMainModule:
   var stack = LinkedStack[string]()
   stack.push("Nim")
   stack.push("Go")
   stack.push("Python")
   stack.push("Object Pascal")
   stack.push("C/C++")
   echo $stack.str()
   echo $stack.pop()
   echo $stack.pop()
   echo $stack.pop()
   echo $stack.str()
   echo $stack.peek()
   stack.clear()
   if stack.is_empty():
      echo "Stack is Empty"
   else:
      echo "Stack not Empty"
  
