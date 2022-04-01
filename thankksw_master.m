%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'thankksw_master';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('thankksw_master.log');
M_.exo_names = 'shz';
M_.exo_names_tex = 'shz';
M_.exo_names_long = 'shz';
M_.exo_names = char(M_.exo_names, 'shi');
M_.exo_names_tex = char(M_.exo_names_tex, 'shi');
M_.exo_names_long = char(M_.exo_names_long, 'shi');
M_.endo_names = 'vy';
M_.endo_names_tex = 'vy';
M_.endo_names_long = 'vy';
M_.endo_names = char(M_.endo_names, 'vc');
M_.endo_names_tex = char(M_.endo_names_tex, 'vc');
M_.endo_names_long = char(M_.endo_names_long, 'vc');
M_.endo_names = char(M_.endo_names, 'vx');
M_.endo_names_tex = char(M_.endo_names_tex, 'vx');
M_.endo_names_long = char(M_.endo_names_long, 'vx');
M_.endo_names = char(M_.endo_names, 'vk');
M_.endo_names_tex = char(M_.endo_names_tex, 'vk');
M_.endo_names_long = char(M_.endo_names_long, 'vk');
M_.endo_names = char(M_.endo_names, 'vn');
M_.endo_names_tex = char(M_.endo_names_tex, 'vn');
M_.endo_names_long = char(M_.endo_names_long, 'vn');
M_.endo_names = char(M_.endo_names, 'vmc');
M_.endo_names_tex = char(M_.endo_names_tex, 'vmc');
M_.endo_names_long = char(M_.endo_names_long, 'vmc');
M_.endo_names = char(M_.endo_names, 'vd');
M_.endo_names_tex = char(M_.endo_names_tex, 'vd');
M_.endo_names_long = char(M_.endo_names_long, 'vd');
M_.endo_names = char(M_.endo_names, 'vcS');
M_.endo_names_tex = char(M_.endo_names_tex, 'vcS');
M_.endo_names_long = char(M_.endo_names_long, 'vcS');
M_.endo_names = char(M_.endo_names, 'vcH');
M_.endo_names_tex = char(M_.endo_names_tex, 'vcH');
M_.endo_names_long = char(M_.endo_names_long, 'vcH');
M_.endo_names = char(M_.endo_names, 'vtH');
M_.endo_names_tex = char(M_.endo_names_tex, 'vtH');
M_.endo_names_long = char(M_.endo_names_long, 'vtH');
M_.endo_names = char(M_.endo_names, 'vpi');
M_.endo_names_tex = char(M_.endo_names_tex, 'vpi');
M_.endo_names_long = char(M_.endo_names_long, 'vpi');
M_.endo_names = char(M_.endo_names, 'vpiw');
M_.endo_names_tex = char(M_.endo_names_tex, 'vpiw');
M_.endo_names_long = char(M_.endo_names_long, 'vpiw');
M_.endo_names = char(M_.endo_names, 'vw');
M_.endo_names_tex = char(M_.endo_names_tex, 'vw');
M_.endo_names_long = char(M_.endo_names_long, 'vw');
M_.endo_names = char(M_.endo_names, 'vmw');
M_.endo_names_tex = char(M_.endo_names_tex, 'vmw');
M_.endo_names_long = char(M_.endo_names_long, 'vmw');
M_.endo_names = char(M_.endo_names, 'vrk');
M_.endo_names_tex = char(M_.endo_names_tex, 'vrk');
M_.endo_names_long = char(M_.endo_names_long, 'vrk');
M_.endo_names = char(M_.endo_names, 'vq');
M_.endo_names_tex = char(M_.endo_names_tex, 'vq');
M_.endo_names_long = char(M_.endo_names_long, 'vq');
M_.endo_names = char(M_.endo_names, 'vi');
M_.endo_names_tex = char(M_.endo_names_tex, 'vi');
M_.endo_names_long = char(M_.endo_names_long, 'vi');
M_.endo_names = char(M_.endo_names, 'vr');
M_.endo_names_tex = char(M_.endo_names_tex, 'vr');
M_.endo_names_long = char(M_.endo_names_long, 'vr');
M_.endo_names = char(M_.endo_names, 'vki');
M_.endo_names_tex = char(M_.endo_names_tex, 'vki');
M_.endo_names_long = char(M_.endo_names_long, 'vki');
M_.endo_names = char(M_.endo_names, 'vkl');
M_.endo_names_tex = char(M_.endo_names_tex, 'vkl');
M_.endo_names_long = char(M_.endo_names_long, 'vkl');
M_.endo_names = char(M_.endo_names, 'vtfi');
M_.endo_names_tex = char(M_.endo_names_tex, 'vtfi');
M_.endo_names_long = char(M_.endo_names_long, 'vtfi');
M_.endo_names = char(M_.endo_names, 'vyS');
M_.endo_names_tex = char(M_.endo_names_tex, 'vyS');
M_.endo_names_long = char(M_.endo_names_long, 'vyS');
M_.endo_names = char(M_.endo_names, 'vyH');
M_.endo_names_tex = char(M_.endo_names_tex, 'vyH');
M_.endo_names_long = char(M_.endo_names_long, 'vyH');
M_.endo_names = char(M_.endo_names, 'vcineq');
M_.endo_names_tex = char(M_.endo_names_tex, 'vcineq');
M_.endo_names_long = char(M_.endo_names_long, 'vcineq');
M_.endo_names = char(M_.endo_names, 'vyineq');
M_.endo_names_tex = char(M_.endo_names_tex, 'vyineq');
M_.endo_names_long = char(M_.endo_names_long, 'vyineq');
M_.endo_names = char(M_.endo_names, 'vctilde');
M_.endo_names_tex = char(M_.endo_names_tex, 'vctilde');
M_.endo_names_long = char(M_.endo_names_long, 'vctilde');
M_.endo_names = char(M_.endo_names, 'vis');
M_.endo_names_tex = char(M_.endo_names_tex, 'vis');
M_.endo_names_long = char(M_.endo_names_long, 'vis');
M_.endo_names = char(M_.endo_names, 'vz');
M_.endo_names_tex = char(M_.endo_names_tex, 'vz');
M_.endo_names_long = char(M_.endo_names_long, 'vz');
M_.endo_partitions = struct();
M_.param_names = 'pbeta';
M_.param_names_tex = 'pbeta';
M_.param_names_long = 'pbeta';
M_.param_names = char(M_.param_names, 'prho');
M_.param_names_tex = char(M_.param_names_tex, 'prho');
M_.param_names_long = char(M_.param_names_long, 'prho');
M_.param_names = char(M_.param_names, 'psigma');
M_.param_names_tex = char(M_.param_names_tex, 'psigma');
M_.param_names_long = char(M_.param_names_long, 'psigma');
M_.param_names = char(M_.param_names, 'palpha');
M_.param_names_tex = char(M_.param_names_tex, 'palpha');
M_.param_names_long = char(M_.param_names_long, 'palpha');
M_.param_names = char(M_.param_names, 'pdelta');
M_.param_names_tex = char(M_.param_names_tex, 'pdelta');
M_.param_names_long = char(M_.param_names_long, 'pdelta');
M_.param_names = char(M_.param_names, 'pomega');
M_.param_names_tex = char(M_.param_names_tex, 'pomega');
M_.param_names_long = char(M_.param_names_long, 'pomega');
M_.param_names = char(M_.param_names, 'pfrisch');
M_.param_names_tex = char(M_.param_names_tex, 'pfrisch');
M_.param_names_long = char(M_.param_names_long, 'pfrisch');
M_.param_names = char(M_.param_names, 'plambda');
M_.param_names_tex = char(M_.param_names_tex, 'plambda');
M_.param_names_long = char(M_.param_names_long, 'plambda');
M_.param_names = char(M_.param_names, 'ps');
M_.param_names_tex = char(M_.param_names_tex, 'ps');
M_.param_names_long = char(M_.param_names_long, 'ps');
M_.param_names = char(M_.param_names, 'ptauD');
M_.param_names_tex = char(M_.param_names_tex, 'ptauD');
M_.param_names_long = char(M_.param_names_long, 'ptauD');
M_.param_names = char(M_.param_names, 'ptauK');
M_.param_names_tex = char(M_.param_names_tex, 'ptauK');
M_.param_names_long = char(M_.param_names_long, 'ptauK');
M_.param_names = char(M_.param_names, 'ppsi');
M_.param_names_tex = char(M_.param_names_tex, 'ppsi');
M_.param_names_long = char(M_.param_names_long, 'ppsi');
M_.param_names = char(M_.param_names, 'ppsiw');
M_.param_names_tex = char(M_.param_names_tex, 'ppsiw');
M_.param_names_long = char(M_.param_names_long, 'ppsiw');
M_.param_names = char(M_.param_names, 'pphipi');
M_.param_names_tex = char(M_.param_names_tex, 'pphipi');
M_.param_names_long = char(M_.param_names_long, 'pphipi');
M_.param_names = char(M_.param_names, 'pphii');
M_.param_names_tex = char(M_.param_names_tex, 'pphii');
M_.param_names_long = char(M_.param_names_long, 'pphii');
M_.param_names = char(M_.param_names, 'prhoi');
M_.param_names_tex = char(M_.param_names_tex, 'prhoi');
M_.param_names_long = char(M_.param_names_long, 'prhoi');
M_.param_names = char(M_.param_names, 'prhoz');
M_.param_names_tex = char(M_.param_names_tex, 'prhoz');
M_.param_names_long = char(M_.param_names_long, 'prhoz');
M_.param_names = char(M_.param_names, 'ssM');
M_.param_names_tex = char(M_.param_names_tex, 'ssM');
M_.param_names_long = char(M_.param_names_long, 'ssM');
M_.param_names = char(M_.param_names, 'sscy');
M_.param_names_tex = char(M_.param_names_tex, 'sscy');
M_.param_names_long = char(M_.param_names_long, 'sscy');
M_.param_names = char(M_.param_names, 'ssxy');
M_.param_names_tex = char(M_.param_names_tex, 'ssxy');
M_.param_names_long = char(M_.param_names_long, 'ssxy');
M_.param_names = char(M_.param_names, 'sscHy');
M_.param_names_tex = char(M_.param_names_tex, 'sscHy');
M_.param_names_long = char(M_.param_names_long, 'sscHy');
M_.param_names = char(M_.param_names, 'ssyHy');
M_.param_names_tex = char(M_.param_names_tex, 'ssyHy');
M_.param_names_long = char(M_.param_names_long, 'ssyHy');
M_.param_names = char(M_.param_names, 'ssySy');
M_.param_names_tex = char(M_.param_names_tex, 'ssySy');
M_.param_names_long = char(M_.param_names_long, 'ssySy');
M_.param_names = char(M_.param_names, 'sscHc');
M_.param_names_tex = char(M_.param_names_tex, 'sscHc');
M_.param_names_long = char(M_.param_names_long, 'sscHc');
M_.param_names = char(M_.param_names, 'sscSc');
M_.param_names_tex = char(M_.param_names_tex, 'sscSc');
M_.param_names_long = char(M_.param_names_long, 'sscSc');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 28;
M_.param_nbr = 25;
M_.orig_endo_nbr = 28;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('thankksw_master_static');
erase_compiled_function('thankksw_master_dynamic');
M_.orig_eq_nbr = 28;
M_.eq_nbr = 28;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 6 0;
 0 7 0;
 0 8 0;
 1 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 34;
 0 14 35;
 0 15 0;
 0 16 36;
 0 17 37;
 2 18 0;
 0 19 0;
 0 20 38;
 0 21 39;
 3 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 4 32 0;
 5 33 0;]';
M_.nstatic = 17;
M_.nfwrd   = 6;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 6;
M_.nspred   = 5;
M_.ndynamic   = 11;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(28, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(25, 1);
M_.NNZDerivatives = [96; -1; -1];
load paramvals;
set_param_value('pbeta',pbeta);
set_param_value('prho',prho);
set_param_value('psigma',psigma);
set_param_value('palpha',palpha);
set_param_value('pdelta',pdelta);
set_param_value('pomega',pomega);
set_param_value('pfrisch',pfrisch);
set_param_value('plambda',plambda);
set_param_value('ps',ps);
set_param_value('ptauD',ptauD);
set_param_value('ptauK',ptauK);
set_param_value('ppsi',ppsi);
set_param_value('ppsiw',ppsiw);
set_param_value('pphipi',pphipi);
set_param_value('pphii',pphii);
set_param_value('prhoi',prhoi);
set_param_value('prhoz',prhoz);
M_.params( 18 ) = 1;
ssM = M_.params( 18 );
M_.params( 20 ) = M_.params(4)*M_.params(5)*(1-M_.params(11))/(M_.params(18)*(M_.params(5)+M_.params(2)));
ssxy = M_.params( 20 );
M_.params( 19 ) = 1-M_.params(20);
sscy = M_.params( 19 );
M_.params( 21 ) = M_.params(19);
sscHy = M_.params( 21 );
sscSy = sscy;
M_.params( 24 ) = M_.params(21)/M_.params(19);
sscHc = M_.params( 24 );
M_.params( 25 ) = sscSy/M_.params(19);
sscSc = M_.params( 25 );
M_.params( 22 ) = (1-M_.params(4))/M_.params(18)+M_.params(4)*M_.params(11)/M_.params(8)/M_.params(18)+M_.params(10)/M_.params(8)*(M_.params(18)-1)/M_.params(18);
ssyHy = M_.params( 22 );
M_.params( 23 ) = (1-M_.params(4))/M_.params(18)+M_.params(4)*(1-M_.params(11))/(1-M_.params(8))/M_.params(18)+(M_.params(18)-1)*(1-M_.params(10))/(1-M_.params(8))/M_.params(18);
ssySy = M_.params( 23 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 24 ) = 0;
oo_.steady_state( 25 ) = 0;
oo_.steady_state( 26 ) = 0;
oo_.steady_state( 27 ) = 0;
oo_.steady_state( 28 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
resid;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
options_.irf = 1000;
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('thankksw_master_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('thankksw_master_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('thankksw_master_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('thankksw_master_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('thankksw_master_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('thankksw_master_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('thankksw_master_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
