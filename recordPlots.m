%准备画图数据

%找出适应度最大函数个体
[cachemat,mincol0] = max(chooseItemPopulation);
loc = mincol0(currentBits+1);
%记录每一步最优方案成本
plotResult(1,generations) = chooseItemPopulation(loc,currentBits+2); 
