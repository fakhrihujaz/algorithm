import std/[sugar,algorithm]

proc bucket_sort(list: seq[int]): seq[int] =
    if len(list) == 0:
       return @[]

    var (min_value,max_value) = (min(list),max(list))
    var bucket_count = int(max_value - min_value) + 1
    var buckets = collect(newSeq):
        for _ in 0..<bucket_count:
           newSeq[int]()
           
    for i in 0..<len(list):
        buckets[(int(list[i] - min_value) div 
                     bucket_count)].add(list[i])

    echo $buckets
    return collect(newSeq):
        for bucket in buckets:
          for v in sorted(bucket): 
              v

if isMainModule:              
   var list1 = @[4,5,3,2,1]
   echo $bucket_sort(list1)
   echo $list1.sorted()
   var list2 = @[0, 1, -10, 15, 2, -2]
   echo $bucket_sort(list2)
   echo $list2.sorted()

