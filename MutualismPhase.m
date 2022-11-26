function Pop=MutualismPhase(i,Pop,func)
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
BF=randperm(2);
BF1=BF(1);
BF2=BF(2);
Mutual_Vector=(xi+xj)/2;
xi_new =xi+rand.*(xbest-Mutual_Vector.*BF1);
xj_new =xj+rand.*(xbest-Mutual_Vector.*BF2);
fi_new=func(xi_new);
fj_new=func(xj_new);
if fi_new<fi && fj_new<fj
    Pop.Point(i,:)=xi_new;
    Pop.Point(j,:)=xj_new;
    Pop.f_value(i)=fi_new;
    Pop.f_value(j)=fj_new;
end