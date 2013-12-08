n = 5;
m = 4;

           Allocation = [0 0 1 2;
                         1 0 0 0;
                         1 3 5 4;
                         0 6 3 2;
                         0 0 1 4];
                     
        Max = [0 0 1 2;
               1 7 5 0;
               2 3 5 6;
               0 6 5 2;
               0 6 5 6];
           
   Available = [1 5 2 0];
   
   Need = Max - Allocation;
   
  % test isSafe
  [Finish, UnlockSequence] = isSafe(m, n, Available, Allocation, Need);
  
  % test request satisfied
  Request = [0 0 0 0;
             0 4 2 0;
             0 0 0 0;
             0 0 0 0;
             0 0 0 0];
  [Available, Allocation, Need] = resourceAllocation(m, n, Available, Allocation, Need, Request, 2);
   
   
  
   
   