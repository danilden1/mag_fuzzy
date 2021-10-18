%   Нечёткая аппроксимация завуисимости: y=x1^2*sin(x2-1) и др.
%                                                      (LR_1_FuzzyApr_ZD.m)
%==========================================================================
close all
%---------------------------------------------
% Построение графика функции  y=x1^2*sin(x2-1)
% в области    x1 e [-7, 3];  x2 e [-4.4, 1.7]
%---------------------------------------------

n = 15;         % количество точек дискретизации
x1 = linspace(-7,     3, n);
x2 = linspace(-4.4, 1.7, n);

y = zeros(n, n);

for i = 1:n
    y(i,:) = x1.^2 * sin(x2(i)-1);   
end    

%---------------------------------------------
h1 = figure(1);
set(h1,'Position',[3   737   330   260])
% get(h1,'Position')
surf(x1, x2, y)
axis([min(x1)  max(x1) ...
      min(x2)  max(x2)  ...
      min(min(y))  max(max(y)) ]); 
view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('Исходная зависимость') 

% %==========================================================================
% yx = zeros(n, n);
% 
% % ********************************* Var_1 ***
% 
% x1 = linspace(-3, 0, n);
% x2 = linspace(-2, 2, n);
% 
% for i = 1:n
%     yx(i,:) = -sin(x1).*sin((x1.^2)/pi)-sin(x2(i))*sin((x2(i)^2)/pi);   
% end    
% %---------------------------------------------
% h2 = figure(2);
% set(h2,'Position',[3   392   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 1') 
% 
% % ********************************* Var_2 ***
% 
% x1 = linspace(0, 2, n);
% x2 = linspace(0, 2, n);
% 
% for i = 1:n
%     yx(i,:) = x1.*sin(4*x1)+1.1*x2(i)*sin(2*x2(i));   
% end    
% %---------------------------------------------
% h3 = figure(3);
% set(h3,'Position',[3   49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 2') 
% 
% % ********************************* Var_3 ***
% 
% x1 = linspace(-4, 2, n);
% x2 = linspace(-5, 3, n);
% 
% yx = zeros(n, n);
% 
% for i = 1:n
%     yx(i,:) = 50-x1.^2 * (cos(x2(i))+1);   
% end    
% %---------------------------------------------
% h4 = figure(4);
% set(h4,'Position',[342   392   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 3') 
% 
% % ********************************* Var_4 ***
% 
% x1 = linspace(-4, 2, n);
% x2 = linspace(-4, 3, n);
% 
% yx = zeros(n, n);
% 
% for i = 1:n
%     yx(i,:) = x1.^2 * (sin(x2(i))+1);   
% end    
% %---------------------------------------------
% h5 = figure(5);
% set(h5,'Position',[342   49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 4') 

% % ********************************* Var_5 ***
%  
% x1 = linspace(-5, 5, n);
% x2 = linspace(-5, 5, n);
% 
% for i = 1:n
%     yx(i,:) = x1.^2 + x2(i).^2;   
% end    
% %---------------------------------------------
% h6 = figure(6);
% set(h6,'Position',[681   392   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 5') 
% 
% % ********************************* Var_6 ***
% 
% x1 = linspace(-6, 6, n);
% x2 = linspace(-6, 6, n);
% 
% for i = 1:n
%     yx(i,:) = x1.^2 - x2(i).^2;   
% end    
% %---------------------------------------------
% h7 = figure(7);
% set(h7,'Position',[681   49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 6') 
% 
% % ********************************* Var_7 ***
% 
% x1 = linspace(-8, 8, n);
% x2 = linspace(-8, 8, n);
% 
% for i = 1:n
%     yx(i,:) = -x1.^2 - x2(i).^2;   
% end 
% %---------------------------------------------
% h8 = figure(8);
% set(h8,'Position',[1020  392   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 7') 
% 
% % ********************************* Var_8 ***
% 
% x1 = linspace(-5, 10, n);
% x2 = linspace(-5, 10, n);
% 
% for i = 1:n
%     yx(i,:) = -x1.^2 + 3*x2(i).^2;   
% end    
% %---------------------------------------------
% h9 = figure(9);
% set(h9,'Position',[1020  49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 8') 
% 
% % ********************************* Var_9 ***
% 
% n = 15;         % количество точек дискретизации
% x1 = linspace(-7,     3, n);
% x2 = linspace(-4.4, 1.7, n);
% 
% y = zeros(n, n);
% 
% for i = 1:n
%     yx(i,:) = -x1.^2 * sin(x2(i)-1);   
% end    
% %---------------------------------------------
% h10 = figure(10);
% set(h10,'Position',[1359 392   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 9') 
% 
% ********************************* Var_10 ***

x1 = linspace(-5, 5, n);
x2 = linspace(-5, 5, n);

for i = 1:n
    yx(i,:) = sin(0.5*x1)*x2(i).^2;   
end    
%---------------------------------------------
h11 = figure(11);
set(h11,'Position',[1359 49   330   260])
surf(x1, x2, yx)
axis([min(x1)  max(x1) ...
      min(x2)  max(x2)  ...
      min(min(yx))  max(max(yx)) ]); 
view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
% title('Var 10') 

% % ********************************************
% % ********************************* Var_11 ***
% 
% x1 = linspace(0, 2*pi, n);
% x2 = linspace(0, 1, n);
% 
% for i = 1:n
%     yx(i,:) = sin(x1)*exp(-3*x2(i));   
% end    
% %---------------------------------------------
% h12 = figure(12);
% set(h12,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 11') 
% 
% % ********************************* Var_12 ***
% 
% x1 = linspace(0, pi, n);
% x2 = linspace(0.1, 5, n);
% 
% for i = 1:n
%     yx(i,:) = sin(x1).^2*log(x2(i));   
% end    
% %---------------------------------------------
% h13 = figure(13);
% set(h13,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 12') 
% 
% % ********************************* Var_13 ***
% 
% x1 = linspace(0, pi, n);
% x2 = linspace(-1, 1, n);
% 
% for i = 1:n
%     yx(i,:) = sin(x1-2*x2(i)).^2*exp(-abs(x2(i)));   
% end    
% %---------------------------------------------
% h14 = figure(14);
% set(h14,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 13') 
% 
% % ********************************* Var_14 ***
% 
% x1 = linspace(-2, 2, n);
% x2 = linspace(-1, 1, n);
% 
% for i = 1:n
%     yx(i,:) = (x1.^2*x2(i)^2 + 2*x1*x2(i)-3)./(x1.^2 +x2(i)^2+1); 
% end    
% ---------------------------------------------
% h15 = figure(15);
% set(h15,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 14') 
% 
% % ********************************* Var_15 ***
% 
% x1 = linspace(-0.1, 1.5, n);
% x2 = linspace(-pi, pi, n);
% 
% for i = 1:n
%     yx(i,:) = sin(x1*x2(i))./x1; 
% end    
% %---------------------------------------------
% h16 = figure(16);
% set(h16,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 15') 
% 
% % ********************************* Var_16 ***
% 
% x1 = linspace(0, 4, n);
% x2 = linspace(0, 4, n);
% 
% for i = 1:n
%     yx(i,:) = (1+x1*x2(i)).*(3-x1)*(4-x2(i)); 
% end    
% %---------------------------------------------
% h17 = figure(17);
% set(h17,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 16') 
% 
% % ********************************* Var_17 ***
% 
% x1 = linspace(-1.5, 1.5, n);
% x2 = linspace(-2.2, 2.2, n);
% 
% for i = 1:n
%     yx(i,:) = exp(-abs(x1)).*(x1.^5+x2(i)^4).*sin(x1*x2(i));
% end    
% %---------------------------------------------
% h18 = figure(18);
% set(h18,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% % title('Var 17') 
% 
% % ********************************* Var_18 ***
% 
% x1 = linspace(-1*pi, 1*pi, n);
% x2 = linspace(-3, 3, n);
% 
% for i = 1:n
%     yx(i,:) = (x2(i)^2-3)*sin(x1/(abs(x2(i))+1));
% end    
% ---------------------------------------------
% h19 = figure(19);
% set(h19,'Position',[1359 49   330   260])
% surf(x1, x2, yx)
% axis([min(x1)  max(x1) ...
%       min(x2)  max(x2)  ...
%       min(min(yx))  max(max(yx)) ]); 
% view(-40,30)
% xlabel('x_1');   ylabel('x_2');   zlabel('y');
% title('Var 18') 
% 
% % ********************************************
% 