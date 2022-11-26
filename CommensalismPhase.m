function Pop=CommensalismPhase(i,Pop,func)
N=Pop.size;
j=randi([1 N]);
while i==j
    j=randi([1 N]);
end
xi=Pop.Point(i,:);
xj=Pop.Point(j,:);
xbest=Pop.BestPoint;
fi=Pop.f_value(i);
xi_new=xi+(rand*2-1).*(xbest-xj);
fi_new=func(xi_new);
if fi_new<fi 
    Pop.Point(i,:)=xi_new;
    Pop.f_value(i)=fi_new;
end