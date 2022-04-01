%% save parameters and rules
save paramvals pbeta prho psigma palpha pdelta pomega pfrisch plambda ps ptauD ptauK ppsi ppsiw pphipi pphii prhoi prhoz

fh = fopen('rulevals.mod','w');
fprintf(fh,'@#define LStype = %i\n',pfrisch==0);
fprintf(fh,'@#define Ktype = %i\n',pomega==0);
fprintf(fh,'@#define PCwtype = %i\n',ppsiw<inf);
fprintf(fh,'@#define noHet = %i\n',plambda==0);
fprintf(fh,'@#define contPC = %i\n',contPC);
fprintf(fh,'@#define noK = %i\n',noK);
fprintf(fh,'@#define SStransfer = %i\n',SStransfer);
fclose(fh);