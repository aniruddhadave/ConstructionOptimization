function f = main
clear 
clc;
answer_using_genetic_algorithm=zeros(10,7);
for K = (300:1:300)
   % options = gaoptimset('OutputFcns',@calling,'PopulationSize',[K]);
FitnessFunction = @(x) func(x);
options = gaoptimset('Vectorized','on','PopulationSize',[105],'Generation',[]);

  global a1;


%[answer_using_genetic_algorithm,val]= ga(@func, 7, [], [],[],[],[1,2,1,2,1,2,1],[3,5,2,3,4,2,4],[],[1,1,2,4,5,6,7],options);
answer_using_genetic_algorithm(K,:)= ga(@func, 7, [], [],[],[],[1,1,1,1,1,1,1],[3,5,3,3,4,3,4],[],[1,2,3,4,5,6,7],options);
val(K,1)=func(answer_using_genetic_algorithm(K,:));
end
[answer_using_genetic_algorithm,val]
end


function a= calling(Population)
 

global a1;
load data;
   for i=(1:1:size(Population,1));
    c(i)=B(Population(i,1),2,1)+B(Population(i,2),2,2)+B(Population(i,3),2,3)+B(Population(i,4),2,4)++B(Population(i,5),2,5)+B(Population(i,6),2,6)+B(Population(i,7),2,7);
 


t(1)=B(Population(i,1),1,1)+B(Population(i,2),1,2)+B(Population(i,5),1,5)+B(Population(i,7),1,7);
t(2)=B(Population(i,1),1,1)+B(Population(i,3),1,3)+B(Population(i,5),1,5)+B(Population(i,7),1,7);
t(3)=B(Population(i,1),1,1)+B(Population(i,4),1,4)+B(Population(i,6),1,6)+B(Population(i,7),1,7);
d(i)=max([t(1),t(2),t(3)]);

   end
Population;
a1= [max(c),min(c),max(d),min(d)] ;
a=a1;
%a1= [max(i,c),min(c),max(i,d),min(d)] ;
     


  
end
function score = func(x)
load data;
x
popsize=size(x,1);
if(popsize~=1)
calling(x);
end

global a1;
for i =(1:1:popsize)
c =B(x(i,1),2,1)+B(x(i,2),2,2)+B(x(i,3),2,3)+B(x(i,4),2,4)++B(x(i,5),2,5)+B(x(i,6),2,6)+B(x(i,7),2,7)
t(1)=B(x(i,1),1,1)+B(x(i,2),1,2)+B(x(i,5),1,5)+B(x(i,7),1,7);
t(2)=B(x(i,1),1,1)+B(x(i,3),1,3)+B(x(i,5),1,5)+B(x(i,7),1,7);
t(3)=B(x(i,1),1,1)+B(x(i,4),1,4)+B(x(i,6),1,6)+B(x(i,7),1,7);
d=max(t)

if(a1(1)==a1(2) && a1(3)==a1(4))
    wc=.5;
    wt=.5;
end
if(a1(1)~=a1(2) && a1(3)~=a1(4))
    vc=a1(1)/(a1(1)-a1(2));
    vt=a1(3)/(a1(3)-a1(4));
    v=vc+vt;
    wc=vc/v;
    wt=vt/v;
end
if(a1(1)~=a1(2) && a1(3)==a1(4))
    wc=0.1;
    wt=0.9;
end
if(a1(3)~=a1(4) && a1(1)==a1(2))
    wc=0.9;
    wt=0.1;
end
score(i,1)=1*(wc*(a1(1)-c)/(a1(1)-a1(2)+1)+wt*(a1(3)-d)/(a1(3)-a1(4)+1));
end
a1
 end
