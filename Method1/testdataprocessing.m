% Just a data processing for test data (which is for validation)
% Refer to the comment in dataprocessing.m to understand this code
clear all;
TestPass = readtable("TestPassing.xlsx",Range="G2:I2080",ReadVariableNames=false);
TestShot = readtable("TestShooting.xlsx",Range="G2:I1272",ReadVariableNames=false);
TestPass=table2array(TestPass);
TestShot=table2array(TestShot);
Total=[TestPass;TestShot];  
originalts=0.02;
ts=0.1;
MovSpeed=5;
n=ts/originalts;
leng=length(Total(:,1));
TestNewData=zeros(leng/5,4);
for i=1:leng
    if (mod(i,5)-1)==0
    TestNewData((fix(i/5)+1),1)=Total(i,1);
    TestNewData((fix(i/5)+1),2)=Total(i,2);
    TestNewData((fix(i/5)+1),3)=Total(i,3);
    TestNewData((fix(i/5)+1),4)=(fix(i/5)+1)*0.1;
    end
end

TestSet=zeros(133,30);
TestSetBackUp=zeros(133,30);
