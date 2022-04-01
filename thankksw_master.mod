% Master dynare file for THANK model with capital
% File nests specifications with/without capital and inequality
% Bilbiie, Känzig and Surico (2021)
% if you have any questions, contact dkaenzig@london.edu

% add dynare path first e.g. addpath('C:\dynare\4.5.7\matlab')
% execute by typing 'dynare thankksw_master'

% Preamble
var vy  % Output
    vc  % Consumption
    vx  % Investment
    vk  % Capital
    vn  % Labor
    vmc % Marginal cost
    vd  % Profits
    vcS % Consumption savers
    vcH % Consumption hand-to-mouth
    vtH % Transfer
    vpi % Inflation
    vpiw% Wage inflation
    vw  % Wage
    vmw % Wage markup
    vrk % Rental rate capital
    vq  % Marginal q
    vi  % Interest rate
    vr  % Ex ante real rate
    vki % Capital income
    vkl % Predetermined k
    vtfi% Total financial income
    vyS % income savers
    vyH % income hand-to-mouth
    vcineq % consumption inequality
    vyineq % income inequality
    vctilde % auxiliary consumption variable for sticky wage setting
    vis % Interest rate shock
    vz; % TFP shock

varexo shz      % TFP disturbance
       shi;     % MP disturbance

parameters pbeta    % Discount factor 
           prho     % Rate of time preference
           psigma   % IES
           palpha   % Capital share
           pdelta   % Depreciation rate
           pomega   % Elasticity of investment to q
           pfrisch  % Frisch elasticity
           plambda  % Share hand-to-mouth
           ps       % Probability to stay S
           ptauD    % Tax on dividends
           ptauK    % Tax on capital income
           ppsi     % Slope PC
           ppsiw    % Slope PC wages
           pphipi   % Taylor rule coefficient
           pphii    % Interest rate smoothing
           prhoi    % Persistence technology
           prhoz    % Persistence technology
           ssM      % Steady state markup
           sscy     % Consumption output ratio
           ssxy     % Investment output ratio
           sscHy    % Consumption H output ratio
           ssyHy    % Income H output ratio
           ssySy    % Income S output ratio
           sscHc    % Consumption H consumption ratio
           sscSc;   % Consumption S consumpion ratio

% Calibration
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


@#include "rulevals.mod"


% Steady state
% Two options: with steady state transfer to equalize consumption or without
@#if SStransfer 
    @#if noK   
        % Steady state without capital
        @#if noHet  
            ssM = 1;            
            ssxy = 0;
            sscy = 1; 
            sscHy = sscy; 
            sscSy = sscy; 
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy;   
            ssyHy = 1;
            ssySy = 1;
        @#else 
            ssM = 1;            
            ssxy = 0;
            sscy = 1; 
            sscHy = sscy; 
            sscSy = sscy; 
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy;   
            ssyHy = (1-palpha)/ssM +  ptauD/plambda*(1 - (1-palpha)/ssM);
            ssySy = (1-palpha)/ssM +  (1-ptauD)/(1-plambda)*(1 - (1-palpha)/ssM);
        @#endif
    @#else   
        % Steady state with capital  
        @#if noHet            
            ssM = 1;          
            ssxy = palpha*pdelta*(1 - ptauK)/(ssM*(prho + pdelta));
            sscy = 1 - ssxy; 
            sscHy = sscy; 
            sscSy = sscy;
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy; 
            ssyHy = 1;
            ssySy = 1;
        @#else 
            ssM = 1;          
            ssxy = palpha*pdelta*(1 - ptauK)/(ssM*(prho + pdelta));
            sscy = 1 - ssxy; 
            sscHy = sscy; 
            sscSy = sscy;
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy; 
            ssyHy = (1-palpha)/ssM + ptauK/plambda*palpha/ssM +  ptauD/plambda*(ssM-1)/ssM;
            ssySy = (1-palpha)/ssM + (1-ptauK)/(1-plambda)*palpha/ssM +  (1-ptauD)/(1-plambda)*(ssM-1)/ssM;
        @#endif
    @#endif
@#else 
    @#if noK   
        % Steady state without capital
        @#if noHet  
            ssM = 1;            
            ssxy = 0;
            sscy = 1; 
            sscHy = sscy; 
            sscSy = sscy; 
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy;   
            ssyHy = 1;
            ssySy = 1;
        @#else 
            ssM = 1;            
            ssxy = 0;
            sscy = 1; 
            ssdy = 1 - (1-palpha)/ssM;
            sstHy = ptauD/plambda*ssdy;
            sscHy = (1-palpha)/ssM + sstHy;
            sscSy = 1/(1-plambda)*(sscy - plambda*sscHy);  
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy;   
            ssyHy = (1-palpha)/ssM +  ptauD/plambda*ssdy;
            ssySy = (1-palpha)/ssM +  (1-ptauD)/(1-plambda)*ssdy;
        @#endif
    @#else   
        % Steady state with capital  
        @#if noHet            
            ssM = 1;          
            ssxy = palpha*pdelta*(1 - ptauK)/(ssM*(prho + pdelta));
            sscy = 1 - ssxy; 
            sscHy = sscy; 
            sscSy = sscy;
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy; 
            ssyHy = 1;
            ssySy = 1;
        @#else 
            ssM = 1;          
            ssxy = palpha*pdelta*(1 - ptauK)/(ssM*(prho + pdelta));
            sscy = 1 - ssxy; 
            ssdy = 1 - ssM^(-1);
            sstHy = ptauD/plambda*ssdy + ptauK/plambda*palpha/ssM;
            sscHy = (1-palpha)/ssM + sstHy; 
            sscSy = 1/(1-plambda)*(sscy - plambda*sscHy); 
            sscHc = sscHy/sscy;
            sscSc = sscSy/sscy; 
            ssyHy = (1-palpha)/ssM + ptauK/plambda*palpha/ssM +  ptauD/plambda*(ssM-1)/ssM;
            ssySy = (1-palpha)/ssM + (1-ptauK)/(1-plambda)*palpha/ssM +  (1-ptauD)/(1-plambda)*(ssM-1)/ssM;
        @#endif
    @#endif
@#endif


model(linear);

% 1: Wage markup
@#if LStype
    pfrisch*vmw = pfrisch*psigma^(-1)*vctilde + vn - pfrisch*vw;
@#else  
    vmw = psigma^(-1)*vctilde + 1/pfrisch*vn - vw;
@#endif

% 1b: auxiliary consumption variable for markup
@#if SStransfer 
    vctilde = vc;
@#else  
    vctilde = plambda*(sscHc)^(-1/psigma)/(plambda*(sscHc)^(-1/psigma)+(1-plambda)*(sscSc)^(-1/psigma))*vcH + (1-plambda)*(sscSc)^(-1/psigma)/(plambda*(sscHc)^(-1/psigma)+(1-plambda)*(sscSc)^(-1/psigma))*vcS;
@#endif

% 2: PC wages
@#if PCwtype
    vpiw = pbeta*vpiw(+1) + ppsiw*vmw;
@#else  
    vpiw/ppsiw = pbeta*vpiw(+1)/ppsiw + vmw;
@#endif

% 3: Wage inflation
vpiw = vw - vw(-1) + vpi;

% 4: Euler bonds, S
vcS = ps*vcS(+1) + (1-ps)*vcH(+1) - psigma*(vi - vpi(+1));

% 5: Euler capital, S
@#if noK
    vq = 0;
@#else 
    vq = pbeta*vq(+1) + ((prho+pdelta)/(1+prho))*vrk(+1) - psigma^(-1)*(vcS(+1) - vcS);
@#endif

% 6: Tobin's q
@#if Ktype
    pomega*vq = (vx - vk(-1));
@#else  
    vq = (vx - vk(-1))/pomega;
@#endif

% 7: Capital accumulation
@#if noK
    vk = 0;
@#else  
    vk = (1-pdelta)*vk(-1) + pdelta*vx;
@#endif

% 8: Budget constraint, H
@#if noHet
    vcH = 0;
@#else  
    sscHy*vcH = (1-palpha)/ssM*(vw + vn) + vtH;
@#endif

% 9: Transfer, H
@#if noHet
    vtH = 0;
@#else  
    @#if noK
        plambda*vtH = ptauD*vd;
    @#else  
        plambda*vtH = ptauD*vd + ptauK*palpha/ssM*(vrk + vk(-1));
    @#endif
@#endif

% 10: Labor demand
vw = vmc +vy - vn;

% 11: Capital demand
@#if noK
    vrk = 0;
@#else  
    vrk = vmc + vy - vk(-1);
@#endif

% 12: Phillips curve
@#if contPC
    vpi = ppsi*vmc;
@#else  
    vpi = pbeta*vpi(+1) + ppsi*vmc;
@#endif

% 13: Production function
@#if noK
    vy = vz + (1-palpha)*vn;
@#else  
    vy = vz + (1-palpha)*vn + palpha*vk(-1);
@#endif

% 14: Profits
@#if noK
    vd = (1-(1-palpha)*ssM^(-1))*vy - (1-palpha)*ssM^(-1)*vmc;
@#else  
    vd = (1-ssM^(-1))*vy - ssM^(-1)*vmc;
@#endif

% 15: Aggregate consumption
vc = plambda*sscHc*vcH + (1-plambda)*sscSc*vcS;

% 16: Resource constraint
vy = sscy*vc + ssxy*vx;

% 17: Taylor
vi = pphii*vi(-1) + (1-pphii)*pphipi*vpi - vis;

% 18: Ex ante real rate
vr = vi - vpi(+1);

% 19-20: Additional variables
vki = vrk + vk(-1);
vkl = vk(-1); 
vtfi = vd/palpha + vki;
ssyHy*vyH = sscHy*vcH;
ssySy*vyS = (1-palpha)/ssM*(vw + vn) + (1-ptauK)*palpha/(ssM*(1-plambda))*(vrk + vk(-1)) + (1-ptauD)/(1-plambda)*vd; 
vcineq = vcS - vcH;
vyineq = vyS - vyH;

% 21-22: Shocks
vis = prhoi*vis(-1) + shi;
vz = prhoz*vz(-1) + shz;

end;

initval;
    vy  = 0;
    vk  = 0;
    vx  = 0;
    vc  = 0;
    vn  = 0;
    vmc = 0;
    vpi = 0;
    vpiw = 0;
    vw  = 0;
    vmw = 0;
    vrk  = 0;
    vq  = 0;
    vi  = 0;
    vr = 0;
    vki = 0;
    vkl = 0;
    vyS = 0;
    vyH = 0;
    vcineq = 0;
    vyineq = 0;
    vctilde = 0;
    vis = 0;
    vz  = 0; 
end;

steady;
check;
resid;

shocks;
var shi; stderr 1;
var shz; stderr 1;
end;
 
stoch_simul(order=1,irf=1000,nograph);  
    
    