# Capital inequality
Matlab and Dynare codes for tractable heterogeneous-agent New Keynesian model with capital.

**Reference**: Bilbiie, Känzig, and Surico (2022), "Capital and Income Inequality: an Aggregate-Demand Complementarity", https://www.sciencedirect.com/science/article/abs/pii/S0304393222000149 (article), https://dkaenzig.github.io/diegokaenzig.com/Papers/bks_paper.pdf (working paper+appendix)

Tested in: Matlab 2019b and Dynare 4.5.7 on Windows 10 (64-bit)

# Contents

**[BKS_replication.m](BKS_replication.m)**: Main shell to replicate all results

**[\subfiles](subfiles):** Subscripts called in `mainAnalysisOilSupplyNews.m`
- [transformAndPlotData.m](subfiles/transformAndPlotData.m): script to transform (and plot) raw data
- [loadProxy.m](subfiles/loadProxy.m): script to read in external instrument
- [runProxyVAR.m](subfiles/runProxyVAR.m): script to estimate proxy VAR; bands are computed using bootstrapping techniques
- [runRigobonVAR.m](subfiles/runRigobonVAR.m): script to estimate heteroskedasticity-based VAR; bands are computed using bootstrapping techniques

**[paper](Känzig&#32;2020&#32;-&#32;The&#32;macroeconomic&#32;effects&#32;of&#32;oil&#32;supply&#32;news.pdf):** Pdf containing paper and online appendix
