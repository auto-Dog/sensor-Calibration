%模拟个体间两两交配 注意：假设每个个体只和另一个个体交配一次，
%交配结果为互换片段的两个新个体 不是正常生物的减数分裂形式

%交叉互换
exchangeRate = 0.4;

[aaa,minCol] = max(chooseItemPopulation);
loc = minCol(currentBits+1);   %代价函数最小值所在处，适应度最大
minVal = chooseItemPopulation(loc,currentBits+1);

for i =1:2:(startpop-1)
    
    if(chooseItemPopulation(i,currentBits+1) == minVal)    %优良基因，直接同化
        %chooseItemPopulation(i+1,:) = chooseItemPopulation(i,:);
        continue;
    end
    
    for j = 1:currentBits
        determine = randi([1,10]);
        if determine <= 10*exchangeRate     %均匀交换
            %防止出现交换后元素重复现象
            if(find(chooseItemPopulation(i+1,1:currentBits)==chooseItemPopulation(i,j)))
                continue;
            end
            if(find(chooseItemPopulation(i,1:currentBits)==chooseItemPopulation(i+1,j)))
                continue;
            end
            tmp0 = chooseItemPopulation(i,j);
            chooseItemPopulation(i,j) = chooseItemPopulation(i+1,j);
            chooseItemPopulation(i+1,j) = tmp0;
        end
    end
end
%fitval;