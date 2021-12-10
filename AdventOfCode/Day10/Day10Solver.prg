using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day10Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data:ToList()
        return
    
    protected override method Solve1() as object
        var beginB := List<char> {}
        beginB:Add('{')
        beginB:Add('[')
        beginB:Add('(')
        beginB:Add('<')
        var amount := 0
       // local endB := { "}", "]", ")", ">" } as List<char>
        foreach var row in _Data
            var stk := Stack<char> {}
            foreach chr as char in row
                if beginB:Contains(chr)
                    stk.Push(chr)
                else
                    var lastB := (Char)stk.Pop()
                    switch chr
                        case ')' 
                            if lastB == '('
                                loop
                            else
                                amount += 3
                            endif
                        case ']' 
                            if lastB == '['
                                loop
                            else
                                amount += 57
                            endif
                        case '}' 
                            if lastB == '{'
                                loop
                            else
                                amount += 1197
                            endif
                        case '>' 
                            if lastB == '<'
                                loop
                            else
                                amount += 25137
                            endif
                    end switch
            exit
                endif
            next
        next
        
            
        return amount // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

end class
