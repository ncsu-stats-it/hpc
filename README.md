<h1>HPC</h1>
The folowing will setup your base R-environment and the minimal packages you will need to start running R simulations on the NCSU HPC linux cluster.
https://hpc.ncsu.edu/main.php<br>
&nbsp;<br>
Due to the quanity of users and number of compute nodes, Campus prefers you use Anaconda to install R your add-on packages.  The <a href="https://hpc.ncsu.edu/Software/Apps.php?app=Conda">instructions</a> currently provided by campus are not "clear" therefore I have provided the following: <br>
&nbsp;<br>
If your campus email is: jdoe22@ncsu.edu <br>
then <strong>UNITYID</strong>=jdoe22 
<hr>
<h2>Initial Setup</h2>
<pre>ssh UNITYID@login.hpc.ncsu.edu
$ git clone https://github.com/ncsu-stats-it/hpc
$ cd hpc
$ git config merge.defaultToUpstream true
$ sh ./install-hpc-env
$ source $HOME/.tcshrc
$ source $HOME/hpc/bin/R-conda-init
$ exit
$ source $HOME/hpc/bin/R-env  (This will take some time 10+ minutes)
$ which R
$ R-PkgInstall "akima","bootstrap","fGarch","rmarkdown","lars","MLEcens","prodlim","RankAggreg","Rlab","survival"
</pre>
<hr>
<h2>Updated R</h2>
Periodically a new version of R will be release.<br>
<pre>$ cd hpc
$ git pull
$ source $HOME/hpc/bin/R-env (This will take some time 10+ minutes)
$ which R
$ R-PkgInstall "akima","bootstrap","fGarch","rmarkdown","lars","MLEcens","prodlim","RankAggreg","Rlab","survival"
</pre>
<hr>
<h2>Running R Program</h2>
<ol>
<li>transfer programs and data to cluster</br>
<strong>/share/$GROUP/$USER/</strong> (Shared Space = Larger Quota)</li>
<li>See: <a href="https://hpc.ncsu.edu/Documents/CopyFiles.php">https://hpc.ncsu.edu/Documents/CopyFiles.php</a></li>
<li>ssh UNITYID@login.hpc.ncsu.edu</li>
<li>cd /share/$GROUP/$USER/</li>
<li>ls</li>
<li>cp /usr/local/apps/samples/guide/weather.R .
<li>ls</li>
<li>bwsubmit 1 Rscript weather.R</li>
<li>bjobs</li>
<li>ls weather.pdf</li>
<li>less weather.*.out</li>
<li>less run_weather.tcsh</li>
<li><strong>[Repeat Option-1 (2 Cores)]</strong>
<li>{modify} run_weather.tcsh</li>
<li>$ bsub &lt; run_weather.tcsh</li>
<li><strong>[Repeat Option-2 (2 Cores)]</strong>
<li>bwsubmit 2 Rscript weather.R</li>
</ol>
<hr>
<h2>R Package Administration</h2>
<ul>
<li>R-ProgramCheck weather.R</li>
<li>R-PkgCheck robustHD</li>
<li>conda install r-robustHD</li>
<li>R-PkgInstall robustHD</li>
<li>R-Pkgcheck robustHD</li>
</ul>
<p>Occasionally you may <strong>not</strong> be able to install an R package.  When this occurs send an email to <a href="mailto:oit_hpc@help.ncsu.edu">oit_hpc@help.ncsu.edu</a> and ask for assitance. They may ask you to recreate your anaconda R environment using different parameters.</p>
