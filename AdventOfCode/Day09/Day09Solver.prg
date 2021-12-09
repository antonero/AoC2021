using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day09Solver inherit SolverBase

    // Private field to store the parsed data
    //  _Data as List<???>
        private _Data as List<string>
        private rows, cols as short
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data:ToList()
        return 
    
    protected override method Solve1() as object
        rows := (short)_Data.Count
        cols := (short)_Data[0].Length
        var r:= 0
        var c:= 0
        var data := Array.CreateInstance(typeof(short), rows, cols)
        foreach var row in _Data
            c := 0
            //row:Select({q => Byte.Parse(q.ToString())}):ToArray()
            
            foreach var col in row:Select({q => Byte.Parse(q.ToString())}):ToList()
                data.SetValue(col, r, c)
                c ++
            next
            
            r ++
        next
        
        local up, down, left, right, sum as int
        for r := 0 to rows - 1
            for c := 0 to cols - 1
                up := r - 1
                down := r + 1
                left := c - 1
                right := c + 1 
                local upVal, downVal, leftVal, rightVal as short
                if up >= 0
                    upVal := (short)data.GetValue(up,c) 
                else 
                    upVal := -1
                endif
                if down < rows
                    downVal := (short)data.GetValue(down,c) 
                else 
                    downVal := -1
                endif
                if left >= 0
                    leftVal := (short)data.GetValue(r,left)
                else
                    leftVal := -1
                endif
                if right < cols
                    rightVal := (short)data.GetValue(r, right)
                else
                    rightVal := -1
                endif
                var val := (short)data.GetValue(r,c)
                if (val < upVal .or. upVal == -1) .and. (val < downVal .or. downVal == -1) .and. (val < leftVal .or. leftVal == -1) .and. (val < rightVal .or. rightVal == -1)
                    sum += val + 1
                endif
            next
        next
        
        return sum // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

end class
