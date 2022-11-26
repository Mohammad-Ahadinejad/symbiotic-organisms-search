function output=BestOrganism(Pop)
fvalue=Pop.f_value;
xvalue=Pop.Point;
n=Pop.size;
for i=1:n
        if fvalue(i,:)==min(fvalue)
            output=xvalue(i,:);
            return
        end
end