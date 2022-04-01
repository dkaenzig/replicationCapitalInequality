function [residual, g1, g2, g3] = thankksw_master_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 28, 1);

%
% Model equations
%

T10 = params(3)^(-1);
T107 = params(18)^(-1);
lhs =y(14);
rhs =T10*y(26)+1/params(7)*y(5)-y(13);
residual(1)= lhs-rhs;
lhs =y(26);
rhs =y(2);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(1)+y(14)*params(13);
residual(3)= lhs-rhs;
lhs =y(12);
rhs =y(11);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(9)+(1-params(9))*y(9)-params(3)*(y(17)-y(11));
residual(5)= lhs-rhs;
lhs =y(16);
rhs =params(1)*y(16)+(params(2)+params(5))/(1+params(2))*y(15);
residual(6)= lhs-rhs;
lhs =y(16);
rhs =(y(3)-y(4))/params(6);
residual(7)= lhs-rhs;
lhs =y(4);
rhs =y(4)*(1-params(5))+params(5)*y(3);
residual(8)= lhs-rhs;
lhs =y(9)*params(21);
rhs =(1-params(4))/params(18)*(y(5)+y(13))+y(10);
residual(9)= lhs-rhs;
lhs =y(10)*params(8);
rhs =params(10)*y(7)+params(4)*params(11)/params(18)*(y(15)+y(4));
residual(10)= lhs-rhs;
lhs =y(13);
rhs =y(6)+y(1)-y(5);
residual(11)= lhs-rhs;
lhs =y(15);
rhs =y(6)+y(1)-y(4);
residual(12)= lhs-rhs;
lhs =y(11);
rhs =params(1)*y(11)+y(6)*params(12);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(28)+y(5)*(1-params(4))+y(4)*params(4);
residual(14)= lhs-rhs;
lhs =y(7);
rhs =y(1)*(1-T107)-y(6)*T107;
residual(15)= lhs-rhs;
lhs =y(2);
rhs =y(9)*params(8)*params(24)+y(8)*(1-params(8))*params(25);
residual(16)= lhs-rhs;
lhs =y(1);
rhs =y(2)*params(19)+y(3)*params(20);
residual(17)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(15)+y(11)*(1-params(15))*params(14)-y(27);
residual(18)= lhs-rhs;
lhs =y(18);
rhs =y(17)-y(11);
residual(19)= lhs-rhs;
lhs =y(19);
rhs =y(15)+y(4);
residual(20)= lhs-rhs;
lhs =y(20);
rhs =y(4);
residual(21)= lhs-rhs;
lhs =y(21);
rhs =y(19)+y(7)/params(4);
residual(22)= lhs-rhs;
lhs =params(22)*y(23);
rhs =y(9)*params(21);
residual(23)= lhs-rhs;
lhs =params(23)*y(22);
rhs =(1-params(4))/params(18)*(y(5)+y(13))+(y(15)+y(4))*params(4)*(1-params(11))/(params(18)*(1-params(8)))+y(7)*(1-params(10))/(1-params(8));
residual(24)= lhs-rhs;
lhs =y(24);
rhs =y(8)-y(9);
residual(25)= lhs-rhs;
lhs =y(25);
rhs =y(22)-y(23);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(27)*params(16)+x(2);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(28)*params(17)+x(1);
residual(28)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(28, 28);

  %
  % Jacobian matrix
  %

T195 = (-((1-params(4))/params(18)));
  g1(1,5)=(-(1/params(7)));
  g1(1,13)=1;
  g1(1,14)=1;
  g1(1,26)=(-T10);
  g1(2,2)=(-1);
  g1(2,26)=1;
  g1(3,12)=1-params(1);
  g1(3,14)=(-params(13));
  g1(4,11)=(-1);
  g1(4,12)=1;
  g1(5,8)=1-params(9);
  g1(5,9)=(-(1-params(9)));
  g1(5,11)=(-params(3));
  g1(5,17)=params(3);
  g1(6,15)=(-((params(2)+params(5))/(1+params(2))));
  g1(6,16)=1-params(1);
  g1(7,3)=(-(1/params(6)));
  g1(7,4)=(-((-1)/params(6)));
  g1(7,16)=1;
  g1(8,3)=(-params(5));
  g1(8,4)=1-(1-params(5));
  g1(9,5)=T195;
  g1(9,9)=params(21);
  g1(9,10)=(-1);
  g1(9,13)=T195;
  g1(10,4)=(-(params(4)*params(11)/params(18)));
  g1(10,7)=(-params(10));
  g1(10,10)=params(8);
  g1(10,15)=(-(params(4)*params(11)/params(18)));
  g1(11,1)=(-1);
  g1(11,5)=1;
  g1(11,6)=(-1);
  g1(11,13)=1;
  g1(12,1)=(-1);
  g1(12,4)=1;
  g1(12,6)=(-1);
  g1(12,15)=1;
  g1(13,6)=(-params(12));
  g1(13,11)=1-params(1);
  g1(14,1)=1;
  g1(14,4)=(-params(4));
  g1(14,5)=(-(1-params(4)));
  g1(14,28)=(-1);
  g1(15,1)=(-(1-T107));
  g1(15,6)=T107;
  g1(15,7)=1;
  g1(16,2)=1;
  g1(16,8)=(-((1-params(8))*params(25)));
  g1(16,9)=(-(params(8)*params(24)));
  g1(17,1)=1;
  g1(17,2)=(-params(19));
  g1(17,3)=(-params(20));
  g1(18,11)=(-((1-params(15))*params(14)));
  g1(18,17)=1-params(15);
  g1(18,27)=1;
  g1(19,11)=1;
  g1(19,17)=(-1);
  g1(19,18)=1;
  g1(20,4)=(-1);
  g1(20,15)=(-1);
  g1(20,19)=1;
  g1(21,4)=(-1);
  g1(21,20)=1;
  g1(22,7)=(-(1/params(4)));
  g1(22,19)=(-1);
  g1(22,21)=1;
  g1(23,9)=(-params(21));
  g1(23,23)=params(22);
  g1(24,4)=(-(params(4)*(1-params(11))/(params(18)*(1-params(8)))));
  g1(24,5)=T195;
  g1(24,7)=(-((1-params(10))/(1-params(8))));
  g1(24,13)=T195;
  g1(24,15)=(-(params(4)*(1-params(11))/(params(18)*(1-params(8)))));
  g1(24,22)=params(23);
  g1(25,8)=(-1);
  g1(25,9)=1;
  g1(25,24)=1;
  g1(26,22)=(-1);
  g1(26,23)=1;
  g1(26,25)=1;
  g1(27,27)=1-params(16);
  g1(28,28)=1-params(17);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],28,784);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],28,21952);
end
end
end
end
