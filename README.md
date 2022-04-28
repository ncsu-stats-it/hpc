<h1>hpc</h1>
The folowing will setup your base R-environment and the minimal packages you will need to start running R simulations on the NCSU HPC linux cluster.
https://hpc.ncsu.edu/main.php<br>
&nbsp;<br>
You will need to request and be given access prior to attempting any of these instructions.
<hr>
<pre>ssh UNITYID@login.hpc.ncsu.edu
git clone https://github.com/ncsu-stats-it/hpc
cd hpc
sh ./install-hpc-env
source ~/.tcshrc
R-env
source ~/.tcshrc
which R
which R-PkgInstall
R-PkgInstall "akima","bootstrap","fGarch","rmarkdown","lars","MLEcens","prodlim","RankAggreg","Rlab","survival","fields"
R-PkgCheck "akima","bootstrap","fGarch","rmarkdown","lars","MLEcens","prodlim","RankAggreg","Rlab","survival","fields"</pre>
