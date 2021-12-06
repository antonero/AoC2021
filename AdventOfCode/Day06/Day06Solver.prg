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
        var count := 0
        var fishList := List<List<byte>>{}
        fishList.Add(_Data)
        try
            do while day < days
                /*
                for var i := 0 to _Data.Count-1
                    var age := _Data[i]
                    if age > 0
                        _Data[i] := -- age
                    else
                        _Data[i] := 6
                        if _Data.Count > 100000000
                            addedFish.Add(9)
                        else
                            _Data.Add(9)
                        endif
                    endif
                next
                */
                for var i := 0 to fishList.Count-1
                    for var j := 0 to fishList[i].Count-1
                        var age := fishList[i][j]
                        if age > 0
                            fishList[i][j] := -- age
                        else
                            fishList[i][j] := 6
                            if fishList[i].Count > 10
                                if fishList.Count == (i + 1) 
                                    var newList := List<byte>{}
                                    fishList.Add(newList)
                                endif
                                fishList[i+1].Add(9)
                            else
                                fishList[i].Add(9)
                            endif   
                        endif
                    next
                next
                day ++
                Console.WriteLine(i"{day} -> {fishList.Count}")
            end do
            foreach var fishes in fishList
                count += fishes:Count
            next
        catch ex as exception
            Console.WriteLine(fishList.Count)
            Console.WriteLine(day)
            Console.WriteLine(ex.Message)
        end try
            
        return  count

end class
