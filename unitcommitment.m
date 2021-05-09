% UNIT COMMITMENT OF 3 GENERATOR SYSTEM_ AJ WOOD AND WOOLEN BURG
clc
lower_lim =[ 150 100 50 ];  upper_lim=[600  400  200];%          lower upper power limits(MW)
  a=[ 510.0  310.0 78.0];  b=[7.20 7.85 7.97];  c=[0.00142  0.00194 0.00482]; % H_coefficients 
  fc=[   1.1  1.0   1.2];% fuel cost in R/Mbtu
   load=550;
%  POSSIBLE COMBINATINS OF UNITS TO MEET LOAD   
c1= [ 0     400 150
      550   0   0
      500   0   50
      295   255 0
      267   233 50];
  f1=zeros(5,1);f2=zeros(5,1);f3=zeros(5,1);
  
  for i1=1:length(c1(:,1))
      for j1=1:length(a)
          if(c1(i1,j1))==0
              f1(i1,j1)=0;
          else
            f1(i1,j1)=(a(j1)+b(j1)*c1(i1,j1)+c(j1)*c1(i1,j1)^2)*fc(j1);
          end
      end
  end
  % Total cost
  t_cost=sum(f1')
  [a1,b1]=min(t_cost);
  p_comb=c1((b1),:)