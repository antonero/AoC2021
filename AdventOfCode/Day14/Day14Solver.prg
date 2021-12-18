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
        return self:SolveIt(10)
        
    private method SolveIt(steps as int) as int64
        var count := 0
        do while count < steps
            var pairs := List<string> {}
            var i := 0
            var polyChar := _poly.ToCharArray()
            do while i < _poly.Length - 1
                pairs.Add(polyChar[i].ToString() + polyChar[i+1].ToString())
                i++
            end do
            var newPoly := StringBuilder {}
            foreach var pair in pairs
                if _Data:TryGetValue(pair, out var val)
                    polyChar := pair.ToCharArray()
                    newPoly.Append(polyChar[0].ToString() + val)
                endif
            next
            count ++
            _poly := newPoly.ToString() + _poly.Last().ToString()
            Console.WriteLine(i"{count}: {_poly.Length}")
        end do
        var chars := _poly.Select({x => x}).Distinct().ToList()
        var totals := Dictionary<char,int64>{}
        foreach var chr in chars
            totals.Add(chr,_poly.Count({x => chr.Equals(x)}))
        next
        var totalsOrdered := totals.OrderBy({x => x.Value})
        var min := totalsOrdered.First().Value
        var max := totalsOrdered.Last().Value
        return max - min // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return self:SolveIt(40)

end class
