%   ???????? ????????????? ???????????: y=x1^2*sin(x2-1)
%                                                         (a2_IssledFIS.m)
%  <<< ???????????? ????????????? ?????? ????????? ?????? >>>
%==========================================================================
clear all
close all

%--------------------------------------------------------------------------

%---------------------------------------------

n = 50;         % ?????????? ????? ?????????????
x1 = linspace(-8, 8, n);
x2 = linspace(-8, 8, n);

y = zeros(n, n);
for i = 1:n
    y(i,:) = -x1.^2 - x2(i).^2;   
end    

%---------------------------------------------
h1 = figure(1);
%set(h1,'Position',[5   554   524   407])
% get(h1,'Position')
surf(x1, x2, y)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('???????? ???????????') 

%--------------------------------------------------------------------------
% ?????????? ??????? ????????? ??????????? ???????
% ? ???????????? ????????? ???????. ?????? ??.?????.
%---------------------------------------------

fM = readfis('firstM_my');        % ???????? ???????? ??????? ? ?????
% getfis(fM);
% showfis(fM);

yM = zeros(n, n);
for i = 1:n
    yM(i,:) = evalfis([x1; ones(size(x1))*x2(i)], fM)';    
end  

%---------------------------------------------

h2 = figure(2);
%set(h2,'Position',[5    65   524   407])
surf(x1, x2, yM)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('??????? ????????? ?????? ??????? (?????.????.????.) - firstM.fis') 

%--------------------------------------------------------------------------
% ?????????? ??????? ????????? ??????????? ???????
% ? ?????????? ????????? ???????. ?????? ??.?????.
%---------------------------------------------

fMg = readfis('firstMg_my_5');       % ???????? ???????? ??????? ? ?????

yMg = zeros(n, n);
for i = 1:n
    yMg(i,:) = evalfis([x1; ones(size(x1))*x2(i)], fMg)';    
end  

yMg_diff = y - yMg;



%---------------------------------------------

h4 = figure(4);
%set(h3,'Position',[536    65   524   407])
surf(x1, x2, yMg)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('??????? ????????? ?????? ??????? (????.????.????.) - firstMg.fis') 


h5 = figure(5);
%set(h3,'Position',[536    65   524   407])
surf(x1, x2, yMg_diff)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('firstMg.fis ???????') 
%--------------------------------------------------------------------------
% ?????????? ??????? ????????? ??????????? ??????
%---------------------------------------------

fS = readfis('firstS_my');       % ???????? ???????? ??????? ? ?????

yS = zeros(n, n);
for i = 1:n
    yS(i,:) = evalfis([x1; ones(size(x1))*x2(i)], fS)';    
end  

%---------------------------------------------

h6 = figure(6);
set(h6,'Position',[1067  65  524  407])
surf(x1, x2, yS)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('??????? ????????? ?????? ?????? - firstS.fis') 

%--------------------------------------------------------------------------
% ?????????? ???????????????????? ???????? ?????? ???????? ?????????????
%---------------------------------------------

% FIS ??????? ? ?????.????.????.????.??.?????.

eMkv = (y-yM).^2;               % ??????? ?????? ???????.? ??????? ??????
SeMkv = sum(sum(eMkv));         % ????? ????????? ?????? ?? ???? ??????
NeM = numel(yM);                % ????? ?????????? ??????????? ?????
RMSE_M = sqrt(SeMkv/NeM);       % ?????????????????? ???????? ??????

% FIS ??????? ? ????.????.????.????.??.?????.
RMSE_Mg = sqrt(sum(sum((y-yMg).^2))/numel(yMg));	% ????????.????.??????

% FIS ??????
RMSE_S = sqrt(sum(sum((y-yS).^2))/numel(yS));       % ????????.????.??????

%---------------------------------------------

disp(' ')
disp('??????? ?????????????? ???????? ?????? ?????????????:')
disp([' FIS ??????? ? ?????.????.????.????.??.?????.:  RMSE = ',  num2str(RMSE_M)])
disp([' FIS ??????? ? ?????.????.????.????.??.?????.:  RMSE = ',  num2str(RMSE_Mg)])
disp([' FIS ??????:                                    RMSE = ',  num2str(RMSE_S)])
disp(' ')

%---------------------------------------------
figure(2);
xlabel(['x_1       RMSE = ',num2str(RMSE_M)]);

figure(4);
xlabel(['x_1       RMSE = ',num2str(RMSE_Mg)]);

figure(6);
xlabel(['x_1       RMSE = ',num2str(RMSE_S)]);
%---------------------------------------------
