%初始化种群
for i=1:startpop
    for k = 1:currentBits
        j = randi([1,90]);
        %防止出现重复位置
        while(find(chooseItemPopulation(i,1:currentBits)==j))
            j = randi([1,90]);
        end
        chooseItemPopulation(i,k) = j;
    end
end
fitval;
