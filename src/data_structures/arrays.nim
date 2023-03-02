import 
    sequtils,
    algorithm,
    unittest


suite "Arrays":
    test "array creation":
        # arrays are constant
        var a = [1, 2, 3, 4, 5]
        var b: array[5, int] 

        check:
            a[0]    == 1
            a.len() == 5
            b.len() == 5
            b[0]    == 0

        # seqs are dynamic
        var c = @[1, 2, 3, 4, 5]
        c.add(6)
        var d: seq[int]

        check:
            c[0]    == 1
            c.len() == 6
            d.len() == 0

    test "array slicing":
        var a = [1, 2, 3, 4, 5]
        var b = a[0..2]     # 0..2 is the first 3 elements
        var c = a[0..^1]    # ^1 is the last element
        var d = a[^3..^1]   # ^3 is the third last element
        var e = a[0..<2]    # 0..<2 is the first 2 elements


        check:
            b.len() == 3
            b[0]    == 1
            b[1]    == 2
            b[2]    == 3

            c.len() == 5
            c[0]    == 1
            c[1]    == 2
            c[2]    == 3
            c[3]    == 4

            d.len() == 3
            d[0]    == 3
            d[1]    == 4

            e.len() == 2
            e[0]    == 1
            e[1]    == 2

    test "array iteration":
        var a = [1, 2, 3, 4, 5]
        var b: seq[int]
        var c = toSeq(1..5)     # collecting iterator to seq 
        for i in a:
            b.add(i*2)

        check:
            b.len() == 5
            b[0]    == 2
            b[1]    == 4
            b[2]    == 6
            b[3]    == 8
            b[4]    == 10

            c.len() == 5
            a.toSeq() == c

    test "array sort":
        var a = [5, 4, 3, 2, 1]
        var b = a
        a.sort()                    # import from algorithm
        check:
            a[0] == 1
            a[1] == 2
            a[2] == 3
            a[3] == 4
            a[4] == 5

        proc myCmp(x, y: int): int =
            if x < y: 1
            elif x > y: -1
            else: 0

        # b.sort(cmp)               # import from algorithm
        # same as:
        b.sort(myCmp)               # import from algorithm
        check:
            b[0] == 5
            b[1] == 4
            b[2] == 3
            b[3] == 2
            b[4] == 1
    
    test "array utils":
        var a = [1, 2, 3, 4, 5]
        var b = a.mapIt(it*2)       # import from sequtils
        var c = a.filterIt(it > 3)  # import from sequtils
        var d = a.filterIt(it > 3).mapIt(it*2)  # import from sequtils

        check:
            b.len() == 5
            b[0]    == 2
            b[1]    == 4
            b[2]    == 6
            b[3]    == 8
            b[4]    == 10

            c.len() == 2
            c[0]    == 4
            c[1]    == 5

            d.len() == 2
            d[0]    == 8
            d[1]    == 10
            