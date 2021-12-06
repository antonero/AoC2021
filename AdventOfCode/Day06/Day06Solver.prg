using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day06Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<byte>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        var list := data[0]:Split(','):ToList()
        _Data := List<byte>{}
        foreach var age in list
            _Data:Add(Byte.Parse(age))
        next
        return
    
    protected override method Solve1() as object
        return self:DoEvolution(80) // Use the _Data field to solve the 1th puzzle and return the result
        
    protected override method Solve2() as object
        return self:DoEvolution(256) // Use the _Data field to solve the 1th puzzle and return the result

    private method DoEvolution(days as int) as Int64
        var day := 0
        try
        do while day < days
            for var i := 0 to _Data.Count-1
                var age := _Data[i]
                if age > 0
                    _Data[i] := -- age
                else
                    _Data[i] := 6
                    _Data.Add(9)
                endif
            next
            day ++
        end do
        catch ex as exception
            Console.WriteLine(day)
            Console.WriteLine(ex.Message)
        end try
            
        return  _Data.Count

end class
