using System
using System.Collections.Generic
using System.Text
using System.Linq

class Day21Solver inherit SolverBase

    // Private field to store the parsed data
    // private _Data as List<???>
    
    protected override method Parse(data as List<string>) as void
        // Parse the List of strings into the _Data field
        return
    
      private method RollDice(dice ref int, steps ref int) as int
         var i := 0
         for i := 1 to 3
            dice ++
            steps += dice
         next
         var module := steps % 10
         return iif(module == 0, 10, module)
      
    protected override method Solve1() as object
         var p1 := 1
         var p2 := 3
         var p1Score := 0
         var p2Score := 0
         var dice := 0
         var steps := 0
         do while p1Score < 1000 .and. p2Score < 1000
            p1Score += self:RollDice(ref dice, ref p1)
            if p1Score < 1000
               p2Score += self:RollDice(ref dice, ref p2)
            endif
         end do
         if p2Score < p1Score
            return p2Score * dice
         else 
            return p1Score * dice
         endif
         
    
    protected override method Solve2() as object
        return nil // Use the _Data field to solve the 1th puzzle and return the result

end class
