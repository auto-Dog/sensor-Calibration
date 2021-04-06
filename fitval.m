%计算适应度
tic;
liveChance = 0;
active = zeros(2,currentBits);
for i=1:startpop
    for k=1:batchsize
        [ordered,~] = sort(chooseItemPopulation(i,1:currentBits));
        active(1,:) = ordered-21;
        active(2,:) = item0(k,ordered);
        %拟合V-T曲线
        deviation = spline(active(2,:),active(1,:),item0(k,:));
        %比较jueduiwucha
        deltaMat = abs(deviation-allTemp);
        %{    
            plot(item0(k,:),deviation,'b--');
            hold on
            plot(item0(k,:),allTemp,'r--');
            plot(item0(k,:),deltaMat,'g--');
        %}
     
        %单点成本
        
        for p = 1:90
            if(deltaMat(p)<=0.5)                  deltaMat(p) = 0;continue;end
            if(deltaMat(p)>0.5&&deltaMat(p)<=1.0) deltaMat(p) = 1;continue;end
            if(deltaMat(p)>1.0&&deltaMat(p)<=1.5) deltaMat(p) = 6;continue;end
            if(deltaMat(p)>1.5&&deltaMat(p)<=2.0) deltaMat(p) = 20;continue;end
            if(deltaMat(p)>2.0)                   deltaMat(p) = 10000;continue;end
        end
        %探索更快的计算方案
        %deltaMat=cost(deltaMat);
        liveChance = liveChance+sum(deltaMat)+currentBits*50;
        
    end
    %方案总体样本
    liveChance = liveChance/batchsize;
    chooseItemPopulation(i,currentBits+2) = liveChance;
    %取倒数，并乘以系数10000*90+currentBits
    chooseItemPopulation(i,currentBits+1) = (10000*90+currentBits*50)/liveChance;
    liveChance = 0;
end
toc;