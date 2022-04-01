%% Main shell to replicate the results from "Capital and income inequality:
% an aggregate-demand complementarity" by Bilbiie, Känzig and Surico (2021)
% if you have any questions, contact dkaenzig@london.edu

clear all
close all
clc

addpath('C:\dynare\4.5.7\matlab')

% The thankksw_master.mod file nests all THANK model specifications:

% Benchmarks:
% Flexible wages: set ppsiw = inf;     -> THANK w/o sticky w
% No idiosyncratic risk: set ps = 1;   -> TANK
% No capital: set noK = 1;             -> THANK w/o K
% No heterogeneity: set plambda = 0;   -> RANK

%% Create tables for main part of the paper (flexible wage case)
% baseline calibration
pbeta = 0.99;       % Discount factor
prho = pbeta^(-1)-1;% Rate of time preference
psigma = 1;         % IES
palpha = 0.33;      % Capital share
pdelta = 0.025;     % Depreciation rate
pomega = 10;        % Elasticity of investment to q (1/(phi*delta))
pfrisch = 1;        % Frisch elasticity of labor supply
plambda = 0;        % Share hand-to-mouth
ps = 1;             % Idiosyncratic risk
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
ppsi = 0.05;        % Slope of PC
ppsiw = inf;        % Slope of PC wages 
pphipi = 1.5;       % Taylor coeff
pphii = 0;          % Interest rate smoothing
prhoi = 0.6;        % Persistence MP shock
prhoz = 0.9;        % Persistence tech shock

% switches
contPC = 0;    % (1: Contemporaneous PC, 0: standard Phillips curve)
noK = 1;       % (1: Model with no capital, 0: Model with capital)
SStransfer = 1; % Steady-state transfers to equalize consumption in steady state

% values used later
plambdaval = 0.27; 
psval = 0.98; 
ppsiwval = 0.075; 

saveParams;

% count average duration of price/wage spell
pthetap = ((1+pbeta+ppsi)-sqrt((1+pbeta+ppsi)^2-4*pbeta))/(2*pbeta);
pdur = 1/(1-pthetap);
pthetaw = ((1+pbeta+ppsiwval)-sqrt((1+pbeta+ppsiwval)^2-4*pbeta))/(2*pbeta);
pdurw = 1/(1-pthetaw);

%% A: Flexible wages
%% Run all models
%% RANK benchmark
dynare thankksw_master
results_rank = oo_;

%% RANK-K 
noK = 0;       % Model with no capital
saveParams;

dynare thankksw_master
results_rankk = oo_;

%% TANK with full redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tank_redist = oo_;

%% TANK with no redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tank = oo_;

%% THANK with full redistribution
noK = 1;           % Model with no capital
plambda = plambdaval;    % Share hand-to-mouth
ptauD = plambda;   % Tax on dividends
ptauK = ptauD;     % Tax on capital income
ps = psval;         % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thank_redist = oo_;

%% THANK with no redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
ps = psval;          % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thank = oo_;


%% TANK-K with full redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = ptauD;      % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankk_redist = oo_;

%% TANK-K with D redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = 0;          % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankk_redistD = oo_;

%% TANK-K with K redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = plambda;    % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankk_redistK = oo_;

%% TANK-K with no redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tankk = oo_;

%% THANK-K with full redistribution
noK = 0;          % Model with no capital
plambda = plambdaval;   % Share hand-to-mouth
ptauD = plambda;  % Tax on dividends
ptauK = ptauD;    % Tax on capital income
ps = psval;        % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankk_redist = oo_;

%% THANK-K with D redistribution
noK = 0;          % Model with no capital
plambda = plambdaval;   % Share hand-to-mouth
ptauD = plambda;  % Tax on dividends
ptauK = 0;        % Tax on capital income
ps = psval;        % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankk_redistD = oo_;

%% THANK-K with K redistribution
% model is indeterminate under sticky wages
if ppsiw>10000
    noK = 0;          % Model with no capital
    plambda = plambdaval;   % Share hand-to-mouth
    ptauD = 0;        % Tax on dividends
    ptauK = plambda;  % Tax on capital income
    ps = psval;        % Idiosyncratic risk
    saveParams;

    dynare thankksw_master
    results_thankk_redistK = oo_;
end

%% THANK-K with no redistribution
noK = 0;        % Model with no capital
plambda = plambdaval; % Share hand-to-mouth
ptauD = 0;      % Tax on dividends
ptauK = ptauD;  % Tax on capital income
ps = psval;      % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankk = oo_;

%% Multipliers
fieldName = 'vc_shi';

hors = [1:1000];
discountFactor = pbeta;
discountFactorVec = discountFactor.^(hors-1);

% pre-allocate
mult_base = zeros(length(hors),1);
mult_rank = zeros(length(hors),1);
mult_rankk = zeros(length(hors),1);
mult_tank_redist = zeros(length(hors),1);
mult_tank = zeros(length(hors),1);
mult_thank_redist = zeros(length(hors),1);
mult_thank = zeros(length(hors),1);
mult_tankk_redist = zeros(length(hors),1);
mult_tankk_redistD = zeros(length(hors),1);
mult_tankk_redistK = zeros(length(hors),1);
mult_tankk = zeros(length(hors),1);
mult_thankk_redist = zeros(length(hors),1);
mult_thankk_redistD = zeros(length(hors),1);
mult_thankk_redistK = zeros(length(hors),1);
mult_thankk = zeros(length(hors),1);
mult_tankliqk_redist = zeros(length(hors),1);
mult_thankliqk_redist = zeros(length(hors),1);
mult_thankliqk = zeros(length(hors),1);

ih = 1;
for mhor = hors
    mult_base(ih,1) = sum(discountFactorVec(1:mhor).*results_rank.irfs.(fieldName)(1:mhor));
    mult_rank(ih,1) = sum(discountFactorVec(1:mhor).*results_rank.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_rankk(ih,1) = sum(discountFactorVec(1:mhor).*results_rankk.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tank_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_tank_redist.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tank(ih,1) = sum(discountFactorVec(1:mhor).*results_tank.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_thank_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_thank_redist.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_thank(ih,1) = sum(discountFactorVec(1:mhor).*results_thank.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tankk_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_tankk_redist.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tankk_redistD(ih,1) = sum(discountFactorVec(1:mhor).*results_tankk_redistD.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tankk_redistK(ih,1) = sum(discountFactorVec(1:mhor).*results_tankk_redistK.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_tankk(ih,1) = sum(discountFactorVec(1:mhor).*results_tankk.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_thankk_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_thankk_redist.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    mult_thankk_redistD(ih,1) = sum(discountFactorVec(1:mhor).*results_thankk_redistD.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    if ppsiw>10000
        mult_thankk_redistK(ih,1) = sum(discountFactorVec(1:mhor).*results_thankk_redistK.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
    end
    mult_thankk(ih,1) = sum(discountFactorVec(1:mhor).*results_thankk.irfs.(fieldName)(1:mhor))./mult_base(ih,1);
 
    ih = ih+1;
end


%% B: Sticky wages
%% Run all models
% reset parameters
plambda = 0;        % Share hand-to-mouth
ps = 1;             % Idiosyncratic risk
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income

% Impose sticky wages
ppsiw = ppsiwval;       % Slope of PC wages

% switches
contPC = 0;    % Contemporaneous PC
noK = 1;       % Model with no capital

saveParams;

%% RANK benchmark
dynare thankksw_master
results_ranksw = oo_;

%% RANK-K 
noK = 0;       % Model with no capital
saveParams;

dynare thankksw_master
results_rankksw = oo_;

%% TANK with full redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tanksw_redist = oo_;

%% TANK with no redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tanksw = oo_;

%% THANK with full redistribution
noK = 1;           % Model with no capital
plambda = plambdaval;    % Share hand-to-mouth
ptauD = plambda;   % Tax on dividends
ptauK = ptauD;     % Tax on capital income
ps = psval;         % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thanksw_redist = oo_;

%% THANK with no redistribution
noK = 1;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
ps = psval;          % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thanksw = oo_;


%% TANK-K with full redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = ptauD;      % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankksw_redist = oo_;

%% TANK-K with D redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = plambda;    % Tax on dividends
ptauK = 0;          % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankksw_redistD = oo_;

%% TANK-K with K redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = plambda;    % Tax on capital income
ps = 1;             % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_tankksw_redistK = oo_;


%% TANK-K with no redistribution
noK = 0;            % Model with no capital
plambda = plambdaval;     % Share hand-to-mouth
ptauD = 0;          % Tax on dividends
ptauK = ptauD;      % Tax on capital income
saveParams;

dynare thankksw_master
results_tankksw = oo_;

%% THANK-K with full redistribution
noK = 0;          % Model with no capital
plambda = plambdaval;   % Share hand-to-mouth
ptauD = plambda;  % Tax on dividends
ptauK = ptauD;    % Tax on capital income
ps = psval;        % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankksw_redist = oo_;

%% THANK-K with D redistribution
noK = 0;          % Model with no capital
plambda = plambdaval;   % Share hand-to-mouth
ptauD = plambda;  % Tax on dividends
ptauK = 0;        % Tax on capital income
ps = psval;        % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankksw_redistD = oo_;

%% THANK-K with K redistribution
% model is indeterminate under sticky-w
if ppsiw>10000
    noK = 0;          % Model with no capital
    plambda = plambdaval;   % Share hand-to-mouth
    ptauD = 0;        % Tax on dividends
    ptauK = plambda;  % Tax on capital income
    ps = psval;        % Idiosyncratic risk
    saveParams;

    dynare thankksw_master
    results_thankksw_redistK = oo_;
end

%% THANK-K with no redistribution
noK = 0;        % Model with no capital
plambda = plambdaval; % Share hand-to-mouth
ptauD = 0;      % Tax on dividends
ptauK = ptauD;  % Tax on capital income
ps = psval;      % Idiosyncratic risk
saveParams;

dynare thankksw_master
results_thankksw = oo_;


%% Multipliers (sticky wages)

% pre-allocate
mult_basesw = zeros(length(hors),1);
mult_ranksw = zeros(length(hors),1);
mult_rankksw = zeros(length(hors),1);
mult_tanksw_redist = zeros(length(hors),1);
mult_tanksw = zeros(length(hors),1);
mult_thanksw_redist = zeros(length(hors),1);
mult_thanksw = zeros(length(hors),1);
mult_tankksw_redist = zeros(length(hors),1);
mult_tankksw_redistD = zeros(length(hors),1);
mult_tankksw_redistK = zeros(length(hors),1);
mult_tankksw = zeros(length(hors),1);
mult_thankksw_redist = zeros(length(hors),1);
mult_thankksw_redistD = zeros(length(hors),1);
mult_thankksw_redistK = zeros(length(hors),1);
mult_thankksw = zeros(length(hors),1);

ih = 1;
for mhor = hors
    mult_basesw(ih,1) = sum(discountFactorVec(1:mhor).*results_ranksw.irfs.(fieldName)(1:mhor)); % mult_base(ih,1); 
    mult_ranksw(ih,1) = sum(discountFactorVec(1:mhor).*results_ranksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_rankksw(ih,1) = sum(discountFactorVec(1:mhor).*results_rankksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tanksw_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_tanksw_redist.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tanksw(ih,1) = sum(discountFactorVec(1:mhor).*results_tanksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_thanksw_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_thanksw_redist.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_thanksw(ih,1) = sum(discountFactorVec(1:mhor).*results_thanksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tankksw_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_tankksw_redist.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tankksw_redistD(ih,1) = sum(discountFactorVec(1:mhor).*results_tankksw_redistD.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tankksw_redistK(ih,1) = sum(discountFactorVec(1:mhor).*results_tankksw_redistK.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_tankksw(ih,1) = sum(discountFactorVec(1:mhor).*results_tankksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_thankksw_redist(ih,1) = sum(discountFactorVec(1:mhor).*results_thankksw_redist.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    mult_thankksw_redistD(ih,1) = sum(discountFactorVec(1:mhor).*results_thankksw_redistD.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    if ppsiw>10000
        mult_thankksw_redistK(ih,1) = sum(discountFactorVec(1:mhor).*results_thankksw_redistK.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    end
    mult_thankksw(ih,1) = sum(discountFactorVec(1:mhor).*results_thankksw.irfs.(fieldName)(1:mhor))./mult_basesw(ih,1);
    
    ih = ih+1;
end


%% Tables

% Flex w
disp('Flexible-wage models:')
T = table({'noK';'K'},[mult_rank(1,1);mult_rankk(1,1)],[mult_tank_redist(1,1); mult_tankk_redist(1,1)],[mult_tank(1,1); mult_tankk(1,1)],[mult_thank(1,1); mult_thankk(1,1)],'VariableNames',{'Table';'RA';'TA prop inc';' TA ineq';'TA ineq n risk'});
disp(T)

% Sticky w
disp('Sticky-wage models:')
Tsw = table({'noK';'K'},[mult_ranksw(1,1);mult_rankksw(1,1)],[mult_tanksw_redist(1,1); mult_tankksw_redist(1,1)],[mult_tanksw(1,1); mult_tankksw(1,1)],[mult_thanksw(1,1); mult_thankksw(1,1)],'VariableNames',{'Table';'RA';'TA prop inc';' TA ineq';'TA ineq n risk'});
disp(Tsw)


%% Figures

% Figure 1
pchi = 1.75; 
lambdas = (0:0.01:0.8)';
ssIY = 0.2350;  % corresponds to investment share under full depreciation.
peta = 2; 
mult1 = (1-lambdas)./(1-lambdas*(1-ssIY)/(1-peta*ssIY));
mult2 = (1-lambdas)./(1-lambdas*pchi);
mult3 = (1-lambdas)./(1-lambdas*pchi*(1-ssIY)/(1-peta*ssIY));

figure('Position',[100 100 400 300],'PaperPositionMode','Auto');
hold on
plot(lambdas,mult1,'LineWidth',1.5,'LineStyle','-.','Color',[0.9290, 0.6940, 0.1250])
plot(lambdas,mult2,'LineWidth',1.5,'LineStyle','--','Color',[0, 0.4470, 0.7410])
plot(lambdas,mult3,'LineWidth',1.5,'Color',[0.8500, 0.3250, 0.0980])
grid on
box on
ylim([0 7])
xlim([0 0.35])
%axis tight
ylabel('dc','Interpreter','latex')
xlabel('$\lambda$','Interpreter','latex')
legend({'Capital inequality','Income inequality','Capital and income inequality'},'Location','NorthWest','Interpreter','latex')

% Figures 2-3
shockNames = {'shi'}; 
shockNamesAllLatex = {'MP shock'}; 

periods = (0:options_.irf-1)';
hor=9;

shockSize = 25;

% Figure 1
varNames = {'vc','vx','vy'}; 
varNamesPaper = {'Consumption','Investment','Output'}; 
npy = 3;
npx = ceil(length(varNames)/npy);

figure('Position',[100 100 750 200],'PaperPositionMode','Auto');
for iplot = 1:length(varNames)
    subplot(npx,npy,iplot)
    varName = varNames{iplot};
    hold on
    if strcmp(varName,'vr')
        plot(periods(1:hor),results_rankksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/100*shockSize,'LineWidth',0.75,'Color','k')
        plot(periods(1:hor),results_tankksw_redist.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/100*shockSize,'LineWidth',1.5,'Color',[0.9290, 0.6940, 0.1250],'LineStyle','-.')
        plot(periods(1:hor),results_thankksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/100*shockSize,'LineWidth',1.5,'Color',[0.8500, 0.3250, 0.0980])
    else
        plot(periods(1:hor),results_rankksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',0.75,'Color','k')
        plot(periods(1:hor),results_tankksw_redist.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.5,'Color',[0.9290, 0.6940, 0.1250],'LineStyle','-.')
        plot(periods(1:hor),results_thankksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.5,'Color',[0.8500, 0.3250, 0.0980])
    end
    if iplot == 3
        leg=legend('RA','HA, prop. incomes','HA, cyclical inequality','AutoUpdate','off','Interpreter','latex');
        leg.ItemTokenSize = [15,18];
    end
    grid on
    if ~ismember(0,get(gca,'ylim'))
        line(get(gca,'xlim'),[0 0],'Color','k')
    end
    xlim([0 hor-1])
    xticks([0:1:hor-1])
    if all(abs(get(gca,'ylim'))<1e-8)
        ylim([-1 1]);
    end
    if strcmp(varName,'vr')
        ylabel('ppt','Interpreter','latex')
    else
        ylabel('\%','Interpreter','latex')
    end
    title(varNamesPaper{iplot},'Interpreter','latex')
    box on
end

% Figure 2: Inequality
varNames = {'vcineq','vyineq'}; % 'vc','vy',
varNamesPaper = {'Consumption inequality','Income inequality'}; % 'Aggregate consumption','Aggregate output',
npy = 2;
npx = ceil(length(varNames)/npy);

figure('Position',[100 100 600 225],'PaperPositionMode','Auto');
for iplot = 1:length(varNames)
    subplot(npx,npy,iplot)
    varName = varNames{iplot};
    hold on
    plot(periods(1:hor),results_thanksw_redist.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.2,'Color',[0.3010, 0.7450, 0.9330],'LineStyle',':')
    plot(periods(1:hor),results_thanksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.5,'Color',[0, 0.4470, 0.7410],'LineStyle','--')
    plot(periods(1:hor),results_thankksw_redist.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.5,'Color',[0.9290, 0.6940, 0.1250],'LineStyle','-.')
    plot(periods(1:hor),results_thankksw.irfs.(strcat(varName,'_',shockNames{1}))(1:hor)'/400*shockSize,'LineWidth',1.5,'Color',[0.8500, 0.3250, 0.0980])
    if iplot == 2
        legend('No capital, prop. incomes','No capital, cyclical ineq.','Capital, prop. incomes','Capital, cyclical ineq.','AutoUpdate','off','Interpreter','latex','Location','Southeast')
    end
    grid on
    if ~ismember(0,get(gca,'ylim'))
        line(get(gca,'xlim'),[0 0],'Color','k')
    end
    xlim([0 hor-1])
    xticks([0:1:hor-1])
    ylim([-0.5 0]);

    ylabel('\%','Interpreter','latex')
    title(varNamesPaper{iplot},'Interpreter','latex')
    box on
end

