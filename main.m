% Symbiotic Organism Search (SOS)
clear; clc; close;

%% initialization
n= 2;   %number of variables in objective function
func= @(X)X(1)^2+X(2)^2;    %objective function
N= 20;  %population size
minBrac=[-5 -5];    %minimum interval of each variable for first organisms.
maxBrac=[5 5];   %maximum interval of each variable for first organisms.
maxItter=70;    %maximum number of itterations
maxK=10;    %maximum number of itterations without changing of best answer 


%% Generatate random initial organisms
for i=1:n
    Pop.Point(:,i)=rand(1,N).*(maxBrac(i)-minBrac(i))+minBrac(i);  
end

%% Loop
k=0;
num_itter=0;
Pop.size=N;
while 1>0
    num_itter=num_itter+1;
    % objective function value in the initial point
    for i=1:n
        % saving history (part1)
        if num_itter==1 && i==1
            for j=1:N
                Pop.f_value(j,:)=func(Pop.Point(j,:));
            end
            History.Point(:,:,num_itter)=Pop.Point;
            History.f_value(:,:,num_itter)=Pop.f_value;
            History.BestValue(:,:,num_itter)=min(Pop.f_value);
        end
        % finding best organism
        Pop.BestPoint=BestOrganism(Pop);
        % Phase : Mutualism
        Pop=MutualismPhase(i,Pop,func);
        % Phase : Commensalism
        Pop=CommensalismPhase(i,Pop,func);
        % Phase : Parasitism
        Pop=ParasitismPhase(i,Pop,func);
    end
    % saving history (part2)
        History.Point(:,:,num_itter+1)=Pop.Point;
        History.f_value(:,:,num_itter+1)=Pop.f_value;
        History.BestPoint(:,:,num_itter+1)=Pop.BestPoint;
        History.BestValue(:,:,num_itter+1)=min(Pop.f_value);
    % Converge condition
    if History.BestValue(:,:,num_itter+1)==History.BestValue(:,:,num_itter)
        k=k+1;
    else
        k=0;
    end
    if num_itter==maxItter || k==maxK 
        break
    end
end
Best_Point=BestOrganism(Pop);
Best_value=min(Pop.f_value);

%% display answer
disp(['Best Point=' num2str(Best_Point)]);
disp(['Best value=' num2str(Best_value)]);

%% convergence history
y(1,:)=History.BestValue(1,1,:);
y(:,end)=[];
x=1:num_itter;
plot(x,y,'LineWidth',2);title('Convergance History');xlabel('number of itteration');ylabel('Best Point');
grid