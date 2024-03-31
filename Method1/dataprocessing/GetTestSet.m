%Let's initize the moving block
% Get Trainingset..... maunally
Blocklook=TestNewData(10:200,1:3);
TotalTime=TestNewData(10:200,4);
plot(TotalTime,Blocklook)
legend('x','y','z')
% I assign Shot as 100, pass as 40, nothing as 0, about to pass: 15, about
% to shot: 70 %After shot: 85

% Here, preview the signal, put the corresponding action value(0 40 100) to
% a output matrix

% change the n value to see the time block at each step
% Here you can create a (133,1) matrix storing the corresponding value
n=132;
XBlock=TestNewData(n*5-4:n*5+5,1);
YBlock=TestNewData(n*5-4:n*5+5,2);
ZBlock=TestNewData(n*5-4:n*5+5,3);
Time=TestNewData(n*5-4:n*5+5,4);
plot(Time,XBlock,Time,YBlock,Time,ZBlock)
legend('x','y','z')


%%

for i=1:133
    XBlock=TestNewData(i*5-4:i*5+5,1);
    YBlock=TestNewData(i*5-4:i*5+5,2);
    ZBlock=TestNewData(i*5-4:i*5+5,3);
    TestSetBackUp(i,1:30)=[XBlock',YBlock',ZBlock'];

end
TestSet=TestSetBackUp;



