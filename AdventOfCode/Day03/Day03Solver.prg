using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day03Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<int>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := List<int>{}
		foreach var d in data
			_Data.Add(Convert.ToInt32(d,2))
		next
		
        return
    
    protected override method Solve1() as object
        var count := 0 
        var bit1 := 0
        var bit2 := 0
        var bit3 := 0
        var bit4 := 0
        var bit5 := 0
        var bit6 := 0
        var bit7 := 0
        var bit8 := 0
        var bit9 := 0
        var bit10 := 0
        var bit11 := 0
        var bit12 := 0
        var half := _Data:Count / 2
        foreach var data in _Data
            if (data & (1 << 0)) != 0
                bit1 ++
            endif
            if (data & (1 << 1)) != 0
                bit2 ++
            endif
            if (data & (1 << 2)) != 0
                bit3 ++
            endif
            if (data & (1 << 3)) != 0
                bit4 ++
            endif
            if (data & (1 << 4)) != 0
                bit5 ++
            endif
            if (data & (1 << 5)) != 0
                bit6 ++
            endif
            if (data & (1 << 6)) != 0
                bit7 ++
            endif
            if (data & (1 << 7)) != 0
                bit8 ++
            endif
            if (data & (1 << 8)) != 0
                bit9 ++
            endif
            if (data & (1 << 9)) != 0
                bit10 ++
            endif
            if (data & (1 << 10)) != 0
                bit11 ++
            endif
            if (data & (1 << 11)) != 0
                bit12 ++
            endif
        next
        var gamma := "" 
        gamma += iif (bit12 >= half, "1", "0") 
        gamma += iif (bit11 >= half, "1", "0") 
        gamma += iif (bit10 >= half, "1", "0") 
        gamma += iif (bit9 >= half, "1", "0") 
        gamma += iif (bit8 >= half, "1", "0") 
        gamma += iif (bit7 >= half, "1", "0") 
        gamma += iif (bit6 >= half, "1", "0") 
        gamma += iif (bit5 >= half, "1", "0") 
        gamma += iif (bit4 >= half, "1", "0") 
        gamma += iif (bit3 >= half, "1", "0") 
        gamma += iif (bit2 >= half, "1", "0") 
        gamma += iif (bit1 >= half, "1", "0") 
        var gammaInt := Convert.ToInt64(gamma, 2)
        var epsilon:= ""
        foreach var bit in gamma:ToCharArray()
            epsilon += iif(bit:ToString() == "1", "0", "1")
        next            
        var epsilonInt := Convert.ToInt64(epsilon, 2)
        
        return gammaInt * epsilonInt // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var oxigen := 0
        var co2 := 0
        var bit0 := List<int> {}
        var bit1 := List<int> {}
        var checkList := List<int> {}
        for var i := 11 downto 0    
            bit0:Clear()
            bit1:Clear()
            foreach var data in _Data
                if i < 11 .and. !checkList:Contains(data)
                    loop
                endif
                if (data & (1 << i)) != 0
                    bit1:Add(data)
                endif
                if (data & (1 << i)) == 0
                    bit0:Add(data)
                endif
            next
            checkList := iif(bit1:Count >= bit0:Count, bit1:ToList(), bit0:ToList())
            if checkList:Count == 1
                oxigen := checkList[0]
                exit
            endif
        next
        checkList:Clear()
        for var i := 11 downto 0    
            bit0:Clear()
            bit1:Clear()
            foreach var data in _Data
                if i < 11 .and. !checkList:Contains(data)
                    loop
                endif
                if (data & (1 << i)) != 0
                    bit1:Add(data)
                endif
                if (data & (1 << i)) == 0
                    bit0:Add(data)
                endif
            next
            checkList := iif(bit0:Count <= bit1:Count, bit0:ToList(), bit1:ToList())
            if checkList:Count == 1
                co2 := checkList[0]
                exit
            endif
        next
        return oxigen * co2 // Use the _Data field to solve the 1th puzzle and return the result

end class
