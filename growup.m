%模拟成长过程中变异

%变异个体概率
variationPop = 0.5;
%优良个体发生变异概率
variationEle = 0.1;
%个体变异基因概率
variationGen = 0.4;
[aaa,minCol] = max(chooseItemPopulation);
loc = minCol(currentBits+1);   %代价函数最小值所在处
minVal = chooseItemPopulation(loc,currentBits+1);

for i = 1:startpop
    if chooseItemPopulation(i,currentBits+1)~=minVal   %保护优势品种,其变异率很小
        rate0 = variationPop;
    else
        rate0 = variationEle;
    end

    tmp02 = randi([1,10]);
    if tmp02 <= rate0*10    %个体发生变异概率
        for k=1:currentBits
            tmp03 = randi([1,10]);

            if tmp03 <= variationGen*10     %点位发生变异概率
                j = randi([1,90]);
                %防止出现重复位置
                while(find(chooseItemPopulation(i,1:currentBits)==j))
                    j = randi([1,90]);
                end
                chooseItemPopulation(i,k) = j;
            end
        end

    end
        
end
fitval;