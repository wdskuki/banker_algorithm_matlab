 n = 5;
 m = 3;
             Allocation = [0 1 0;
                           2 0 0;
                           3 0 2;
                           2 1 1;
                           0 0 2];
         Max = [7 5 3;
                3 2 2;
                9 0 2;
                2 2 2;
                4 3 3];
     
  Available = [3 3 2];
  
  Need = Max - Allocation;
  
  % test isSafe
  [Finish, UnlockSequence] = isSafe(m, n, Available, Allocation, Need);
  
  
  
  % test request satisfied
  Request = [0 0 0;
             1 0 2;
             0 0 0;
             0 0 0;
             0 0 0];
  [Available, Allocation, Need] = resourceAllocation(m, n, Available, Allocation, Need, Request, 2);
  
  
  
  Request = [0 0 0;
             0 0 0;
             0 0 0;
             0 0 0;
             3 3 0];
  [Available, Allocation, Need] = resourceAllocation(m, n, Available, Allocation, Need, Request, 5);
  
  
  Request = [0 2 0;
             0 0 0;
             0 0 0;
             0 0 0;
             0 0 0];
  [Available, Allocation, Need] = resourceAllocation(m, n, Available, Allocation, Need, Request, 1);