clear all;
% X Y Z
Pass = readtable("Passing.xlsx",Range="G2:I5169",ReadVariableNames=false);
Shot = readtable("Shooting.xlsx",Range="G2:I4553",ReadVariableNames=false);
Pass=table2array(Pass);
Shot=table2array(Shot);
Total=[Pass;Shot];
% orginal sample time
originalts=0.02;
% The sample time we use for classification
ts=0.1;
% This is the speed for you to move the time block
MovSpeed=5;
n=ts/originalts;
leng=length(Total(:,1));
NewData=zeros(leng/5,4);
% Get the time block x1 y1 z1 x2 y2 z2 ..... x10 y10 z10
for i=1:leng
    if (mod(i,5)-1)==0
    NewData((fix(i/5)+1),1)=Total(i,1);
    NewData((fix(i/5)+1),2)=Total(i,2);
    NewData((fix(i/5)+1),3)=Total(i,3);
    NewData((fix(i/5)+1),4)=(fix(i/5)+1)*0.1;
    end
end
% Initialize the 
TrainingSet=zeros(380,31);
TrainingSetBackUp=zeros(380,31);






