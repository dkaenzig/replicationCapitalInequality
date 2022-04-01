function [residual, g1, g2, g3] = thankksw_master_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(28, 1);
T10 = params(3)^(-1);
T120 = params(18)^(-1);
lhs =y(19);
rhs =T10*y(31)+1/params(7)*y(10)-y(18);
residual(1)= lhs-rhs;
lhs =y(31);
rhs =y(7);
residual(2)= lhs-rhs;
lhs =y(17);
rhs =params(1)*y(37)+y(19)*params(13);
residual(3)= lhs-rhs;
lhs =y(17);
rhs =y(18)-y(2)+y(16);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =params(9)*y(34)+(1-params(9))*y(35)-params(3)*(y(22)-y(36));
residual(5)= lhs-rhs;
lhs =y(21);
rhs =params(1)*y(39)+(params(2)+params(5))/(1+params(2))*y(38)-T10*(y(34)-y(13));
residual(6)= lhs-rhs;
lhs =y(21);
rhs =(y(8)-y(1))/params(6);
residual(7)= lhs-rhs;
lhs =y(9);
rhs =y(1)*(1-params(5))+params(5)*y(8);
residual(8)= lhs-rhs;
lhs =params(21)*y(14);
rhs =(1-params(4))/params(18)*(y(10)+y(18))+y(15);
residual(9)= lhs-rhs;
lhs =y(15)*params(8);
rhs =params(10)*y(12)+params(4)*params(11)/params(18)*(y(1)+y(20));
residual(10)= lhs-rhs;
lhs =y(18);
rhs =y(11)+y(6)-y(10);
residual(11)= lhs-rhs;
lhs =y(20);
rhs =y(11)+y(6)-y(1);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =params(1)*y(36)+y(11)*params(12);
residual(13)= lhs-rhs;
lhs =y(6);
rhs =y(33)+y(10)*(1-params(4))+y(1)*params(4);
residual(14)= lhs-rhs;
lhs =y(12);
rhs =y(6)*(1-T120)-y(11)*T120;
residual(15)= lhs-rhs;
lhs =y(7);
rhs =y(14)*params(8)*params(24)+y(13)*(1-params(8))*params(25);
residual(16)= lhs-rhs;
lhs =y(6);
rhs =y(7)*params(19)+y(8)*params(20);
residual(17)= lhs-rhs;
lhs =y(22);
rhs =params(15)*y(3)+y(16)*(1-params(15))*params(14)-y(32);
residual(18)= lhs-rhs;
lhs =y(23);
rhs =y(22)-y(36);
residual(19)= lhs-rhs;
lhs =y(24);
rhs =y(1)+y(20);
residual(20)= lhs-rhs;
lhs =y(25);
rhs =y(1);
residual(21)= lhs-rhs;
lhs =y(26);
rhs =y(24)+y(12)/params(4);
residual(22)= lhs-rhs;
lhs =params(22)*y(28);
rhs =params(21)*y(14);
residual(23)= lhs-rhs;
lhs =params(23)*y(27);
rhs =(1-params(4))/params(18)*(y(10)+y(18))+(y(1)+y(20))*params(4)*(1-params(11))/(params(18)*(1-params(8)))+y(12)*(1-params(10))/(1-params(8));
residual(24)= lhs-rhs;
lhs =y(29);
rhs =y(13)-y(14);
residual(25)= lhs-rhs;
lhs =y(30);
rhs =y(27)-y(28);
residual(26)= lhs-rhs;
lhs =y(32);
rhs =params(16)*y(4)+x(it_, 2);
residual(27)= lhs-rhs;
lhs =y(33);
rhs =params(17)*y(5)+x(it_, 1);
residual(28)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(28, 41);

  %
  % Jacobian matrix
  %

T211 = (-((1-params(4))/params(18)));
  g1(1,10)=(-(1/params(7)));
  g1(1,18)=1;
  g1(1,19)=1;
  g1(1,31)=(-T10);
  g1(2,7)=(-1);
  g1(2,31)=1;
  g1(3,17)=1;
  g1(3,37)=(-params(1));
  g1(3,19)=(-params(13));
  g1(4,16)=(-1);
  g1(4,17)=1;
  g1(4,2)=1;
  g1(4,18)=(-1);
  g1(5,13)=1;
  g1(5,34)=(-params(9));
  g1(5,35)=(-(1-params(9)));
  g1(5,36)=(-params(3));
  g1(5,22)=params(3);
  g1(6,13)=(-T10);
  g1(6,34)=T10;
  g1(6,38)=(-((params(2)+params(5))/(1+params(2))));
  g1(6,21)=1;
  g1(6,39)=(-params(1));
  g1(7,8)=(-(1/params(6)));
  g1(7,1)=(-((-1)/params(6)));
  g1(7,21)=1;
  g1(8,8)=(-params(5));
  g1(8,1)=(-(1-params(5)));
  g1(8,9)=1;
  g1(9,10)=T211;
  g1(9,14)=params(21);
  g1(9,15)=(-1);
  g1(9,18)=T211;
  g1(10,1)=(-(params(4)*params(11)/params(18)));
  g1(10,12)=(-params(10));
  g1(10,15)=params(8);
  g1(10,20)=(-(params(4)*params(11)/params(18)));
  g1(11,6)=(-1);
  g1(11,10)=1;
  g1(11,11)=(-1);
  g1(11,18)=1;
  g1(12,6)=(-1);
  g1(12,1)=1;
  g1(12,11)=(-1);
  g1(12,20)=1;
  g1(13,11)=(-params(12));
  g1(13,16)=1;
  g1(13,36)=(-params(1));
  g1(14,6)=1;
  g1(14,1)=(-params(4));
  g1(14,10)=(-(1-params(4)));
  g1(14,33)=(-1);
  g1(15,6)=(-(1-T120));
  g1(15,11)=T120;
  g1(15,12)=1;
  g1(16,7)=1;
  g1(16,13)=(-((1-params(8))*params(25)));
  g1(16,14)=(-(params(8)*params(24)));
  g1(17,6)=1;
  g1(17,7)=(-params(19));
  g1(17,8)=(-params(20));
  g1(18,16)=(-((1-params(15))*params(14)));
  g1(18,3)=(-params(15));
  g1(18,22)=1;
  g1(18,32)=1;
  g1(19,36)=1;
  g1(19,22)=(-1);
  g1(19,23)=1;
  g1(20,1)=(-1);
  g1(20,20)=(-1);
  g1(20,24)=1;
  g1(21,1)=(-1);
  g1(21,25)=1;
  g1(22,12)=(-(1/params(4)));
  g1(22,24)=(-1);
  g1(22,26)=1;
  g1(23,14)=(-params(21));
  g1(23,28)=params(22);
  g1(24,1)=(-(params(4)*(1-params(11))/(params(18)*(1-params(8)))));
  g1(24,10)=T211;
  g1(24,12)=(-((1-params(10))/(1-params(8))));
  g1(24,18)=T211;
  g1(24,20)=(-(params(4)*(1-params(11))/(params(18)*(1-params(8)))));
  g1(24,27)=params(23);
  g1(25,13)=(-1);
  g1(25,14)=1;
  g1(25,29)=1;
  g1(26,27)=(-1);
  g1(26,28)=1;
  g1(26,30)=1;
  g1(27,4)=(-params(16));
  g1(27,32)=1;
  g1(27,41)=(-1);
  g1(28,5)=(-params(17));
  g1(28,33)=1;
  g1(28,40)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],28,1681);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],28,68921);
end
end
end
end
