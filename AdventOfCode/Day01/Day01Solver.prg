using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day01Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<int>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<int>{}
		foreach var d in data
			_Data.Add(Int32.Parse(d))
		next
		
        return
    
    protected override method Solve1() as object
		var count := 0
        var prevDepth := 0
        foreach var depth in _Data
            if prevDepth > 0 .and. prevDepth < depth
                count ++
            endif
            prevDepth := depth
        next
        
        return count // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
		var count := 0
        var curThree := 0
        var nextThree := 0
        var tot := _Data.Count - 4
        for var i := 0 to tot
            curThree := _Data[i] + _Data[i+1] + _Data[i+2]
            nextThree := _Data[i+1] + _Data[i+2] + _Data[i+3]
            if nextThree > curThree
                count ++
            endif
        next
        
        return count // Use the _Data field to solve the 1th puzzle and return the result

end class
