using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day08Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<List<string>>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<List<string>>{}
        foreach var row in data
            _Data.Add(row.Split(' '):ToList())
        next
        
        return
    
    protected override method Solve1() as object
        var count := 0
        var digits := List<int> {}
        digits:Add(2)
        digits:Add(3)
        digits:Add(4)
        digits:Add(7)
        foreach var row in _Data
            var found := false
            foreach var digit in row
                if digit == "|"
                    found := true
                    loop
                endif
                if found
                    var len := digit:length
                    if digits:Contains(len)
                        count ++
                    endif
                endif
            next
        next 
        
        return count // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var count := 0
        var digits := Dictionary<string,string>{}
        digits:Add("acedgfb","8")
        digits:Add("cdfbe", "5")
        digits:Add("gcdfa", "2")
        digits:Add("fbcad", "3")
        digits:Add("dab", "7")
        digits:Add("cefabd", "9")
        digits:Add("cdfgeb", "6")
        digits:Add("eafb", "4")
        digits:Add("cagedb", "0")
        digits:Add("ab", "1")
        foreach var row in _Data
            var found := false
            var number := ""
            foreach var digit in row
                if digit == "|"
                    found := true
                    loop
                endif
                if found
                    var val := ""
                    if digits:TryGetValue(digit, out val)
                        number += val
                    endif
                endif
            next
            count += Int32.Parse(number)
        next 
        
        return count
end class
