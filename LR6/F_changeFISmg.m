function FISnew = F_changeFISmg(param, FISold, Msht)
% ��������� ����� ���������� (param) �������� ������� FISold

FISnew = FISold;

% ����������������� ������������� ����������
param = param ./ Msht;

% ������� ������������ ������
FISnew.rule(5).weight = param(1);
FISnew.rule(6).weight = param(2);
FISnew.rule(7).weight = param(3);

% ������������ ������������� ������ ������� ����������
FISnew.input(1).mf(1).params(1) = param(4);
FISnew.input(1).mf(2).params(1) = param(5);
FISnew.input(1).mf(3).params(1) = param(6);	
FISnew.input(2).mf(1).params(1) = param(7);
FISnew.input(2).mf(2).params(1) = param(8);
FISnew.input(2).mf(3).params(1) = param(9);

% ������������ ������������� ������ �������� ����������
FISnew.output(1).mf(1).params(1) = param(10);
FISnew.output(1).mf(2).params(1) = param(11);
FISnew.output(1).mf(3).params(1) = param(12);
FISnew.output(1).mf(4).params(1) = param(13);
FISnew.output(1).mf(5).params(1) = param(14);

% �����.��������� �������.������ ������� ����������     
FISnew.input(1).mf(2).params(2) = param(15);
FISnew.input(2).mf(2).params(2) = param(16);

% �����.��������� �������.������ �������� ����������     
FISnew.output(1).mf(2).params(2) = param(17);
FISnew.output(1).mf(3).params(2) = param(18);
FISnew.output(1).mf(4).params(2) = param(19);