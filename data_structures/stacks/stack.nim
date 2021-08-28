type
  Stack*[T] = ref object
    stack*: seq[T]
    limit*: int

proc newStack*[T](): Stack[T] =
    return Stack[T](
        stack: @[],
        limit: 10
    )

proc bools*[T](stack: seq[T]): bool =
    return stack.len != 0
    
proc push*(self: Stack,data: auto) =
    if self.stack.len >= self.limit:
       echo "Stack Over Flow"
    self.stack.add(data)

proc pop*(self: Stack): auto =
    return self.stack.pop()

proc peek*(self: Stack): auto =
    return self.stack[^1]

proc is_empty*(self: Stack): bool =
    return not bools(self.stack)

proc size*(self: Stack): int =
    return self.stack.len
    
proc is_full*(self: Stack): bool =
    return self.size() == self.limit

proc contains*[T](self: Stack,item: T): bool =
    return item in self.stack
    
