function wd=cal2wd1(cal)
% cal2wd	将公历年月日转换到星期几
%  wd=cal2wd1(cal)  返回星期几
%  cal：1x3矩阵，3列分别为年月日
%
% 这个函数假设去掉了1582年10月5日至14日。
% 在公元1582年10月4日24:00点之前使用儒略历，公元1582年10月15日00:00点之后使用公历

Y=cal(1);
M=cal(2);
D=cal(3);

if ((M==1)||(M==2))	% 一月、二月当作前一年的十三、十四月
	M=M+12;
	Y=Y-1;
end

if ((Y<1582)||((Y==1582)&&(M<10))||((Y==1582)&&(M==10)&&(D<5)))	% 判断是否在1582年10月5日前
	A=mod((D+2*M+floor((3*(M+1))/5)+Y+floor(Y/4)+5),7);	% 1582年10月5日前的公式
else
	A=mod((D+2*M+floor((3*(M+1))/5)+Y+floor(Y/4)-floor(Y/100)+floor(Y/400)),7);	% 1582年10月5日后的公式
end

wd=A+1;
