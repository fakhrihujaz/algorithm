
proc bead_sort(list: var seq[int]): void =
    let n = list.len
    var m = int.low

    for i in 0..<n:
        if list[i] > m:
           m = list[i]

    var beads = newSeq[int](m * n)

    for i in 0..<n:
        for j in 0..<m:
            if j < list[i]:
               beads[i * m + j] = 1

    for j in 0..<m:
        var sum = 0
        for i in 0..<n:
            sum += beads[i * m + j]
            beads[i * m + j] = 0
        for i in n - sum..<n:
            beads[i * m + j] = 1

    for i in 0..<n:
        var j = 0
        while j < m:
              if beads[i * m + j] == 0:
                 break
              inc j
        list[i] = j

var list = @[5,4,3,2,1]

bead_sort(list)

echo $list
