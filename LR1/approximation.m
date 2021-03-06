clear all
n = 15;         % количество точек дискретизации
x1 = linspace(-8, 8, n);
x2 = linspace(-8, 8, n);
y = zeros(n, n);
for i = 1:n
    y(i,:) = -x1.^2 - x2(i).^2;   
end    
[X1, X2] = meshgrid(x1,x2);
SF = fit([X1(:),X2(:)],y(:),'poly11')
[xx, yy] = meshgrid(x1,x2); % новые точки
zz = SF(xx,yy); % значение в новых точках
figure()
% set(h3,'Position',[3   49   330   260])
surf(x1, x2, y)
hold on
surf(xx,yy,zz,'FaceColor',[0.1 0.1 0.1])
axis([min(x1)  max(x1) ...
      min(x2)  max(x2)  ...
      min(min(y))  max(max(y)) ]); 
%view(-40,30)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('аппроксимация') 
%%
int = 3;
interval = [-8 -1 1 8];
n=5;
figure()
surf(x1, x2, y)
hold on
for k = 1:3
    for j = 1:3
        x1 = linspace(interval(k),interval(k+1),n);
        x2 = linspace(interval(j),interval(j+1),n);
        y = zeros(n, n);
        for i = 1:n
            y(i,:) = -x1.^2 - x2(i).^2;   
        end    
        [X1, X2] = meshgrid(x1,x2);
        temp = ['x1:', num2str(x1(1)), '  x2:', num2str(x2(1))];
        disp(temp)
        SF = fit([X1(:),X2(:)],y(:),'poly11')
        [xx, yy] = meshgrid(x1,x2); % новые точки
        zz = SF(xx,yy); % значение в новых точках
        surf(xx,yy,zz,'FaceColor',[0.1 0.1 0.1])
    end
end