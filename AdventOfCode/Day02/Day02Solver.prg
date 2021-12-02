using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day02Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data
        return
    
    protected override method Solve1() as object
        var depth := 0
        var distance := 0
        foreach var mov in _Data
            if mov:Contains("forward")
                distance += Int32.Parse(mov:Substring(8))
            elseif mov:Contains("down")
                depth += Int32.Parse(mov:Substring(5))
            elseif mov:Contains("up")
                depth -= Int32.Parse(mov:Substring(3))
            endif
        next
        
        return depth * distance // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var aim := 0
        var move := 0
        var depth := 0
        var distance := 0
        foreach var mov in _Data
            if mov:Contains("forward")
                move := Int32.Parse(mov:Substring(8))
                distance += move
                if aim != 0
                    depth += move * aim
                endif
            elseif mov:Contains("down")
                aim += Int32.Parse(mov:Substring(5))
            elseif mov:Contains("up")
                aim -= Int32.Parse(mov:Substring(3))
            endif
        next
        
        return depth * distance
        return nil // Use the _Data field to solve the 1th puzzle and return the result
    
end class
