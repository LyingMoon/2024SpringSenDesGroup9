%% Run this first
%Let's initize the moving block
% Get Trainingset..... maunally
Blocklook=NewData(1030:1300,1:3);
TotalTime=NewData(1030:1300,4);
plot(TotalTime,Blocklook)
legend('x','y','z')
% I assign Shot as 100, pass as 40, nothing as 0, about to pass: 15, about
% to shot: 70 %After shot: 85
n=5;
XBlock=NewData(n*5-4:n*5+5,1);
YBlock=NewData(n*5-4:n*5+5,2);
ZBlock=NewData(n*5-4:n*5+5,3);
Time=NewData(n*5-4:n*5+5,4);
plot(Time,XBlock,Time,YBlock,Time,ZBlock)
legend('x','y','z')

%% Assign a output value maunally 

TrainingSetBackUp(n,1:30)=[XBlock',YBlock',ZBlock'];
TrainingSetBackUp(n,31)=70; % Change the value there for each time block

TrainingSet(n,1:30)=[XBlock',YBlock',ZBlock'];
TrainingSet(n,31)=TrainingSetBackUp(n,31);




