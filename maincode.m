%进化算法，解决选标定问题 这个版本采用十进制基因链

%读入数据
clear all;
minput=dlmread('dataform_testA.csv');
Nsample=size(minput,1)/2;Npoint=size(minput,2);
item0=zeros(Nsample,Npoint);
item0=minput([2:2:size(minput,1)],:);

%参数设定
batchsize = size(item0,1);
startpop = 100;  %必须是偶数
currentBits = 7;
generations = 0;
epochs = 50;
x=1:epochs;
allTemp = -20:69;
plotResult = zeros(1,epochs);

%chooseItem = zeros(1,90);
%chooseItemPopulation = zeros(startpop,91);      %最后一位记录当前个体适应度
bestRes = zeros(1,91);   %二进制链，最后一位记录当前个体成本

    
    chooseItemPopulation = zeros(startpop,currentBits+2);    %十进制形式基因串，倒数第二位记录适应度，最后一位记录当前个体成本
    initPopulation;
  
    while(generations<epochs)
        obs1;       %进行淘汰，重新选择
        reproduce;      %繁殖过程，交叉互换
        growup;         %成长过程，发生变异
        generations = generations+1;
        recordPlots;    %准备绘图数据 
        %if(generations>10&&(plotResult(1,generations)-plotResult(1,generations-1)<0.5))  break;end;      
        fprintf('%d, %d\n',currentBits,generations);
    end
    %记录最好结果
    bestRes(1,chooseItemPopulation(loc,1:currentBits)) = 1;
    bestRes(1,91) = floor(chooseItemPopulation(loc,currentBits+2));


%mergePop;
%显示最好结果以及其迭代过程图像
plot(1:generations,plotResult(1,1:generations),'b');
fprintf('\n[');
for i=1:90
    if(bestRes(i)==1)
        fprintf('%d ',i-21);
    end
end
fprintf('%d ',bestRes(91));
fprintf('] \n');

