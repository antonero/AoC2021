using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day07Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<short>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        var list := data[0]:Split(','):ToList()
        _Data := List<short>{}
        foreach var age in list
            _Data:Add(Int16.Parse(age))
        next
        return
        
    protected override method Solve1() as object
        return self:Calc(false)
    
    protected override method Solve2() as object
        return self:Calc(true)
    
    private method Calc(secondVersion as logic) as int
        var min := _Data:Min()
        var max := _Data:Max()
        var fuel := Dictionary<short,int>{}
        local i := 0 as short
        for i := min to max
            var sum := 0
            foreach var pos in _Data
                if !secondVersion
                    sum += Math.Abs(pos-i)
                else
                    var steps := Math.Abs(pos-i)
                    sum += steps * ( steps + 1 ) / 2
                endif
            next
            fuel:Add(i,sum)
        next
        return fuel:Min( { x => x:Value } )
end class
