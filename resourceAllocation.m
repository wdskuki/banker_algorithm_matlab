%   m : resource num
%   n : processes num  

function  [Available, Allocation, Need] = resourceAllocation(m, n, Available, Allocation, Need, Request, i)
    if(isequal(Request(i,:) <= Need(i,:),ones(1,m))) %Request_i <= Need_i?
        if(isequal(Request(i,:) <= Available,ones(1,m)))    %Request_i <= Available
            %suppose allocate resource
            Available = Available - Request(i,:);
            Allocation(i,:) = Allocation(i,:) + Request(i,:);
            Need(i,:) = Need(i,:) - Request(i,:);
            
            %judge if safe
            [Finish, UnlockSequence] = isSafe(m, n, Available, Allocation, Need);
            if(isequal(Finish,ones(1,n))) % safe
                disp('Request Resource successfully');
            else %unsafe
                disp('Have to be waiting and recover...');
                %recover the original condition
                Available = Available + Request(i,:);
                Allocation(i,:) = Allocation(i,:) - Request(i,:);
                Need(i,:) = Need(i,:) + Request(i,:);
            end
        else
            disp('Have to be waiting...');
        end
    else
        disp('wrong request condition');
    end
end