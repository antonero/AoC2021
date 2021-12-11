using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day10Solver inherit SolverBase

    // Private field to store the parsed data
    private _Data as List<string>
    private _Data2 as List<string>
    private beginB as List<char>
    //private endB as List<char>
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        _Data := data:ToList()
        return
    
    protected override method Solve1() as object
        _Data2 := List<string>{}
        beginB := List<char> {}
        beginB:Add('{')
        beginB:Add('[')
        beginB:Add('(')
        beginB:Add('<')
       /* _endB := List<char> {}
        endB:Add('}')
        endB:Add(']')
        endB:Add(')')
        endB:Add('>')
        */
        var amount := 0
       // local endB := { "}", "]", ")", ">" } as List<char>
        foreach var row in _Data
            var incomplete := true
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
                    incomplete := false
            exit
                endif
            next
            if incomplete
                _Data2:Add(row)
            endif
        next
        
            
        return amount // Use the _Data field to solve the 1th puzzle and return the result
    
    protected override method Solve2() as object
        var scores := List<Int64> {}
        foreach var row in _Data2
            var stk := Stack<char> {}
            foreach chr as char in row
                if beginB:Contains(chr)
                    stk.Push(chr)
                else
                    stk.Pop()
                endif
            next
            local score := 0 as Int64
            do while stk.Count > 0
                score *= 5
                var lastChr := (Char)stk.Pop()
                switch lastChr
                    case '(' 
                        score += 1
                    case '[' 
                        score += 2
                    case '{' 
                        score += 3
                    case '<' 
                        score += 4
                end switch
            end do
            scores:Add(score)
        next
        scores:Sort()
        var middle := scores:Count / 2
        return scores[middle]// Use the _Data field to solve the 1th puzzle and return the result

end class
