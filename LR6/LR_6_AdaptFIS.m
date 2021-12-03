%   �������� ������������� �����������: y=x1^2*sin(x2-1)
%                                                         (LR_6_AdaptFIS.m)
%
%  <<<        ��������� ������� ��������� ������ �������       >>>
%  <<< � �������������� ������� ���������� ����������� fmincon >>>
%  <<<              ������ Optimization Toolbox                >>>
%==========================================================================
clear all       % ������� ������ (leaving the workspace empty)
clc             % ������� ���������� ����  (Clear Command Window)  
%--------------------------------------------------------------------------
% ���������� ������� �������  y=x1^2*sin(x2-1)
% � �������    x1 = [-7, 3];  x2 = [-4.4, 1.7]
%---------------------------------------------
n = 15;  

x1 = linspace(-8, 8, n);
x2 = linspace(-8, 8, n);
y = zeros(n,n);
for i = 1:n
    y(i,:) = -x1.^2 - x2(i).^2;   
end  

%---------------------------------------------
h1 = figure(1);
%set(h1,'Position',[622   541   524   407])
% get(h1,'Position')
surf(x1, x2, y)
axis([-9     9 ...
      -9	9 ...
      -130   50]); 
%view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('�������� �����������') 
%%
%--------------------------------------------------------------------------
% ���������� ������� ��������� ����������� �������
% � ���������� ��������� �������. ������ ��.�����.
%---------------------------------------------

fisMg = readfis('firstMg_my_5');     % �������� �������� �������� ����. � �����
% fuzzy(fisMg)                    % ����� FIS-Editor � �������� ���.����.

yMg = zeros(n, n);
for i = 1:n
    yMg(i,:) = evalfis([x1; ones(size(x1))*x2(i)], fisMg)';    
end  

%---------------------------------------------

h2 = figure(2);
%set(h2,'Position',[1154  541  524  407])
colormap('default')
surf(x1, x2, yMg)
axis([-9     9 ...
      -9	9 ...
      -130   50]);
%view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('������� ��������� ������ ������� �� ���������') 

%--------------------------------------------------------------------------
% ������������ ���������� � ��������� �������� ������
%---------------------------------------------

Nob = 60;                       % ���������� ����� ���������� ������� 
Nts = 60;                       % ���������� ����� ��������� ������� 

RndStt = 3;                     %  ���.�������.����.�����.����.�����
rand('state',RndStt);

% �����:
x1ob = min(x1)+(max(x1)-min(x1))*rand(Nob,1);
x2ob = min(x2)+(max(x2)-min(x2))*rand(Nob,1);
x1ts = min(x1)+(max(x1)-min(x1))*rand(Nts,1);
x2ts = min(x2)+(max(x2)-min(x2))*rand(Nts,1);

% ������:

yob = zeros(size(x1ob));
for i = 1:Nob
    yob(i) = -x1ob(i)^2 - x2ob(i)^2;   
end   

yts = zeros(size(x1ts));
for i = 1:Nts
    yts(i) = -x1ts(i)^2 - x2ts(i)^2;   
end

%---------------------------------------------

h3 = figure(3);
%set(h3,'Position',[91   541   524   407])
clf
hold on
plot(x1ob, x2ob, 'bs', 'MarkerSize',4)
plot(x1ts, x2ts, 'ro', 'MarkerSize',4)
hold off
axis([min(x1)-0.01  max(x1)+0.01 ...
      min(x2)-0.01  max(x2)+0.01]); 
xlabel('x1');   ylabel('x2');
title('������������� ������ ��������� (bs) � �������� (or) �������') 

%---------------------------------------------

pause(2);               % ����� 2,0 �

figure(2);          
colormap('white')     % 
hold on
plot3(x1ob, x2ob, yob, 'bs', 'MarkerSize',3,  'MarkerFaceColor','b')
plot3(x1ts, x2ts, yts, 'ro', 'MarkerSize',3,  'MarkerFaceColor','r')
hold off

%--------------------------------------------------------------------------
% ������� ��������� ������� ��������� ������
%---------------------------------------------
% ������������� ��������� (19 ��):
%    - ������� ������������ ������ 5, 6, 7  (3 ��.);
%    - ����. ����.������ ���������� x1, x2, y (3+3+5=11 ��.);
%    - �����.��������� ������ "�������" ���������� x1, x2 (2 ��.);
%    - �����.����.����."���� ����.", "����.", "���� ����." �����. y (3 ��.)
%-----------------
% ������� ������������ ������
w0 = [1  1  1]-0.001;   % ��������� �����������
wL = [0  0  0];         % ������ �������
wU = [1  1  1];         % ������� �������

% ������������ ������������� ������ ����������
x1_s10 = fisMg.input(1).mf(1).params(1);	% ���. ����. ��� x1 "������"
x1_s20 = fisMg.input(1).mf(2).params(1);	%       -//-        "�������"	
x1_s30 = fisMg.input(1).mf(3).params(1);	%       -//-        "�������"		

x2_s10 = fisMg.input(2).mf(1).params(1);	% ���. ����. ��� x2 "������"	
x2_s20 = fisMg.input(2).mf(2).params(1);	%       -//-        "�������"	
x2_s30 = fisMg.input(2).mf(3).params(1);	%       -//-        "�������"	

y_s10 = fisMg.output(1).mf(1).params(1);	% ���.����.��� y "������"	
y_s20 = fisMg.output(1).mf(2).params(1);	%       -//-     "���� ��������"	
y_s30 = fisMg.output(1).mf(3).params(1);	%       -//-     "�������"		
y_s40 = fisMg.output(1).mf(4).params(1);	%       -//-     "���� ��������"	
y_s50 = fisMg.output(1).mf(5).params(1);	%       -//-     "�������"	

x12ys0 = [x1_s10  x1_s20  x1_s30 ...    % �������.����.����. � ���� ������
         x2_s10  x2_s20  x2_s30 ...
         y_s10   y_s20   y_s30    y_s40    y_s50];
x12ysL = 0.7*x12ys0;    % ������ ������� = ��������� ����������� - 30%                      
x12ysU = 1.3*x12ys0;	% ������� ������� = ��������� ����������� + 30%
  
% �����.��������� �������.������ ������� � �������� ����������     
x1_c20 = fisMg.input(1).mf(2).params(2);	% ���. ����. ��� x1 "�������"
x2_c20 = fisMg.input(2).mf(2).params(2);	%    -//-        x2 "�������"	  
y_c20 = fisMg.output(1).mf(2).params(2);	%    -//-        y "���� ��������"	
y_c30 = fisMg.output(1).mf(3).params(2);	%    -//-        y    "�������"		
y_c40 = fisMg.output(1).mf(4).params(2);	%    -//-        y "���� ��������"	
     
x12yc0 = [x1_c20  x2_c20  y_c20  y_c30  y_c40];

dx1 = 0.3*(max(x1)-min(x1));
dx2 = 0.3*(max(x2)-min(x2));
dy = 0.2*(max(max(y))-min(min(y)));
x12ycL = x12yc0 - [dx1 dx2 dy dy dy];       % ������ �������                      
x12ycU = x12yc0 + [dx1 dx2 dy dy dy];       % ������� �������

% ����������� ������������� ���������� � ���� ������ 
ParamFis0 = [w0  x12ys0  x12yc0];       % ��������� �����������
ParamFisL = [wL  x12ysL  x12ycL];       % ������ �������
ParamFisU = [wU  x12ysU  x12ycU];       % ������� �������

% ���������.��������.���������� (���������. � �����. F_changeFISmg)
%Msht = [1  1  1  1  1  1  1  1  1  0.1  0.1  0.1  0.1  0.1  1  1  0.04  0.04  0.04];
Msht = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];   % ���������� �����.�����.
ParamFis0 = ParamFis0 .* Msht;
ParamFisL = ParamFisL .* Msht;
ParamFisU = ParamFisU .* Msht;

%---------------------------------------------
% ��������� �����������

% optimset('fmincon')     % ����� ��������� � ���.� �����. ��������� �����.  

% options = [];
options = optimset('Display', 'iter');      % ����� ���. �� ������ ��������
options.MaxIter = 25;                       % ������������ ����� ��������
options.DiffMinChange = 0.0001;
options.DiffMaxChange = 0.2;
options.LargeScale = 'off';

%---------------------------------------------
% �����������

[ParamFis_opt, sqrtFis, flag] = fmincon(@F_errFISmg, ParamFis0, [], [], [], [], ...
    ParamFisL, ParamFisU, [], options, fisMg, [x1ob, x2ob], yob, Msht);

fisMgOpt = F_changeFISmg(ParamFis_opt, fisMg, Msht);	% ����.�����.���.����� �������.

% fuzzy(fisMgOpt)
% showfis(fisMgOpt)

%---------------------------------------------
% ���������� ������� ��ר����� ����������� ������� ����� ���������

yMgOpt = zeros(n, n);
for i = 1:n
    yMgOpt(i,:) = evalfis([x1; ones(size(x1))*x2(i)], fisMgOpt)';    
end  

%---------------------------------------------

h4 = figure(4);
%set(h4,'Position',[1154  52  524  407])
colormap('default')
surf(x1, x2, yMgOpt)
axis([-9     9 ...
      -9	9 ...
      -130   50]);
view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('������� ��������� ������ ������� ����� ���������') 

pause(2.5);               % ����� 2,5 �

colormap('white')     % 
hold on
plot3(x1ob, x2ob, yob, 'bs', 'MarkerSize',3,  'MarkerFaceColor','b')
plot3(x1ts, x2ts, yts, 'ro', 'MarkerSize',3,  'MarkerFaceColor','r')
hold off

%--------------------------------------------------------------------------
% ���������� �������������������� �������� ������ �������� �������������
%---------------------------------------------

% FIS ������� �� �����������
ytsMg = evalfis([x1ts, x2ts], fisMg);                   % ������� FIS �� ����.�������
RMSE_Mg = sqrt(sum((yts-ytsMg).^2)/numel(yts));         % ��������.����.������

% FIS ������� ����� �����������
ytsMgOpt = evalfis([x1ts, x2ts], fisMgOpt);             % ������� FIS �� ����.�������
RMSE_MgOpt = sqrt(sum((yts-ytsMgOpt).^2)/numel(yts));	% ��������.����.������

disp(' ')
disp('������� �������������� �������� ������ �������������:')
disp(['  - �� ���������:     RMSE = ',  num2str(RMSE_Mg)])
disp(['  - ����� ���������:  RMSE = ',  num2str(RMSE_MgOpt)])
disp(' ')

figure(2);          
xlabel(['x_1       RMSE = ',num2str(RMSE_Mg)]);
figure(4);          
xlabel(['x_1       RMSE = ',num2str(RMSE_MgOpt)]);

%---------------------------------------------
% close([h1 h2 h3 h4])
