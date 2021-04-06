k = 1;
ordered = [-17 -3 12 22 36 64 68] 
tmpspmat = ordered;
vol_of_tmp = item0(k,ordered+21);

deviation = spline(vol_of_tmp,tmpspmat,item0(k,:));
std = 2*ones(1,90);
deltaMat = abs(deviation-allTemp);
plot(item0(k,:),deviation,'b--');
hold on
plot(item0(k,:),allTemp,'r--');
plot(item0(k,:),std,'r');
plot(item0(k,:),deltaMat,'g--');