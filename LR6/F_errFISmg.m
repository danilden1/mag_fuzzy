function errFISmg = F_errFISmg(param, FISiter, inputFIS, target, Msht)
% ������ ������ ��� ����� ���������� (param) �������� ������� FISiter

% ��������� ����� ���������� �������� �������
FISiter = F_changeFISmg(param, FISiter, Msht);

% �������� �����:
outFIS = evalfis(inputFIS, FISiter);
 
% ������ ������:
errFISmg = sqrt(sum((target-outFIS).^2)/numel(outFIS));	% ��������.����.������