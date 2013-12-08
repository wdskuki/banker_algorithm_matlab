%   m : resource num
%   n : processes num  

function   [Finish, UnlockSequence] = isSafe(m, n, Available, Allocation, Need)
Finish = zeros(1,n);
UnlockSequence = zeros(1,n);%unlockable sequence order of processes 
Work = Available;

index = 1; % index of the processes order
while(1)
    flag = 0;%judge if break
    for i = 1: n
       if(  isequal(    (Need(i,:) <= Work), ones(1,m)  ) && (~Finish(i))) % Need_i <= Work ?
           flag = 1;
           Work = Work + Allocation(i,:);
           UnlockSequence(index) = i; 
           index = index + 1;
           Finish(i) =  1;
       end
    end
    if(flag == 0)
        break;
    end
end

if(isequal(Finish, ones(1,n)))
    disp('Safe');
else
    disp('Unsafe');
end
end