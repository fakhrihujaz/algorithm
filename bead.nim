import pkg/[strfmt]

proc bead_sort(list: var seq[int]): void =
    echo "Process bead sort is start!!"
    let n = list.len
    var m = int.low
    echo "Check element list is non-negative integer"
    for i in 0..<n:
        if list[i] > m:
           m = list[i]
    echo "Checking is done the result is m = {}".fmt(m)

    var beads = newSeq[int](m * n)
    echo "create beads with size is m * n = {}".fmt(m * n)

    echo "insert element in beads"
    for i in 0..<n:
        for j in 0..<m:
            echo "insert if {} < {} ".fmt(j,list[i])
            if j < list[i]:
               echo "beads index is {} * {} + {}".fmt(i,m,j)
               beads[i * m + j] = 1
               echo "beads[{}] = 1".fmt(i * m + j)
    echo "beads after first insertion = {}".fmt(beads)

    for j in 0..<m:
        var sum = 0
        for i in 0..<n:
            sum += beads[i * m + j]
            beads[i * m + j] = 0
        for i in n - sum..<n:
            beads[i * m + j] = 1
    echo "beads after all insertion =  ",$beads
    
    for i in 0..<n:
        var j = 0
        while j < m:
              echo "beads[{} * {} + {}] = {}".fmt(i,m,j,beads[i * m + j])
              if beads[i * m + j] == 0:
                 break
              inc j
        list[i] = j
        echo "list[{}] = {}".fmt($i,$j)
        echo "list = {}".fmt($list)
    echo "Process bead sort is done!!"
    
var list = @[5,4,3,2,1]

echo "Unsorted list = {}".fmt($list)

bead_sort(list)

echo "Sorted list = {}".fmt($list)
