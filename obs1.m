%根据适应度进行轮盘赌
totalLiveChance = floor(sum(chooseItemPopulation(:,currentBits+1))); %保证整数，便于取随机值函数
tmpIP = zeros(startpop,currentBits+2);
for i =1:startpop
    ptrloc = randi([1,totalLiveChance]); %保证是整数格式
    ptrloc = floor(ptrloc);
    ptrBlock = 0;  %当前指针停在哪个个体对应色盘段上
    %{
         v(3)
    || --- | -- | ---- ||
       123   45   6789
      结果为在第1段上
    %}
    while(ptrloc>0)
        %对实际适应度取倒数后*10000*90来形成“面积区”
        ptrloc = ptrloc-(chooseItemPopulation(ptrBlock+1,currentBits+1));    %取值越大，生存几率越大
        ptrBlock = ptrBlock+1;
    end
    tmpIP(i,:) = chooseItemPopulation(ptrBlock,:);
end
chooseItemPopulation = tmpIP;
