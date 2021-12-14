using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day14Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as Dictionary<string, string>
    private _poly as string
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := Dictionary<string,string>{}
        _poly := data[0]
        var i := 2
        do while i < (data.Count) 
            var parts := data[i].Split(' ')
            _Data:Add(parts[0],parts[2])
            i++
        end do
        
        return
    
    protected override method Solve1() as object
        var count := 0
        do while count < 10
            var pairs := List<string> {}
            var i := 0
            do while i < _poly.Length - 1
                var polyChar := _poly.ToCharArray()
                pairs.Add(polyChar[i].ToString() + polyChar[i+1].ToString())
                i++
            end do
            var newPoly := ""
            foreach var pair in pairs
                if _Data:TryGetValue(pair, out var val)
                    var polyChar := pair.ToCharArray()
                    newPoly += polyChar[0].ToString() + val
                endif
            next
            count ++
            _poly := newPoly + _poly.Last().ToString()
        end do
        return _poly // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

end class
