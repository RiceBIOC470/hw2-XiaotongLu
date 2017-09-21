

    %按列拆开x矩阵，求每列平均数

function A=Meannonan(x)
n=size(x,2);
 A=zeros(1,n);
for j=1:n
    y=x(:,j);
    notin=isnan(y);
    yyy=mean(y(notin==0));
A(1,j)=yyy;
end
%disp(A)
end

%function J=Meannonan(x)
 %  n=size(x,2);
%for j=1:n
 %   y=x(:,j);
  %  notin=isnan(y);
   % J=mean(y(notin==0));
    %disp(J');
%end
%end
