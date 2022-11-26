function Pop=ParasitismPhase(i,Pop,func)
N=Pop.size;
j=randi([1 N]);
while i==j
    j=randi([1 N]);
end
xi=Pop.Point(i,:);
xj=Pop.Point(j,:);
xbest=Pop.BestPoint;
fi=Pop.f_value(i);
fj=Pop.f_value(j);
Parasite_Vector=xi+(rand*2-1).*(xbest-xi);
f_Parasite_Vector=func(Parasite_Vector);
if f_Parasite_Vector<Pop.f_value(j)
    Pop.Point(j,:)=Parasite_Vector;
    Pop.f_value(j)=f_Parasite_Vector;
end