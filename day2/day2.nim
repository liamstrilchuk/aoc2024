import std/strutils
import std/sequtils
import std/sugar

proc isSafe(vals: seq[int]): bool =
    var safeInc, safeDec = true

    for i in (low(vals) + 1)..high(vals):
        let diff = vals[i] - vals[i - 1]

        if not (1 <= diff and diff <= 3):
            safeInc = false
        
        if not (-3 <= diff and diff <= -1):
            safeDec = false

    return safeInc or safeDec

proc main() =
    let contents = readFile("input.txt")
    let lines = contents.split("\n")

    var part1, part2 = 0

    for line in lines:
        let values = line.split(" ").map(x => parseInt(x))
        
        if isSafe(values):
            part1 += 1
            part2 += 1
        else:
            for i in low(values)..high(values):
                let newSeq = concat(values[0..^(len(values) + 1 - i)], values[(i + 1)..^1])
                
                if isSafe(newSeq):
                    part2 += 1
                    break
    
    echo "Part 1: ", part1
    echo "Part 2: ", part2

main()