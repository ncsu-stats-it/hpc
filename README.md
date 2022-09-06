<h1>HPC</h1>
The folowing will setup your base R-environment and the minimal packages you will need to start running R simulations on the NCSU HPC linux cluster.
https://hpc.ncsu.edu/main.php<br>
&nbsp;<br>
Due to the quanity of users and number of compute nodes, Campus prefers you use Anaconda to install R your add-on packages.  The <a href="https://hpc.ncsu.edu/Software/Apps.php?app=Conda">instructions</a> currently provided by campus are not "clear" therefore I have provided the following: <br>
&nbsp;<br>
If your campus email is: jdoe22@ncsu.edu <br>
then <strong>UNITYID</strong>=jdoe22<br>
<p>
For most users:<br>
$GROUP=<strong>statistics</strong><br>
$USER=<strong>UNITYID</strong><br>
<hr>
<h2>Initial Setup</h2>
<pre>ssh UNITYID@login.hpc.ncsu.edu
$ mkdir -p /usr/local/usrapps/$GROUP/$USER
$ git clone https://github.com/ncsu-stats-it/hpc
$ cd hpc
$ git config merge.defaultToUpstream true
$ sh ./install-hpc-env
$ source $HOME/.tcshrc
$ source $HOME/hpc/bin/R-conda-init
$ exit
ssh UNITYID@login.hpc.ncsu.edu
$ source $HOME/hpc/bin/R-env.csh  (This will take some time 20+ minutes)
$ which R
$ conda install -y r-akima r-bootstrap r-fGarch r-rmarkdown r-lars r-MLEcens r-prodlim r-RankAggreg r-Rlab r-survival
</pre>
<hr>
<h2>Updated R</h2>
Periodically a new version of R will be release.<br>
<pre>ssh UNITYID@login.hpc.ncsu.edu
$ cd $HOME/hpc
$ git pull
$ source $HOME/hpc/bin/R-env.csh (This will take some time 20+ minutes)
$ which R
$ conda install -y r-akima r-bootstrap r-fGarch r-rmarkdown r-lars r-MLEcens r-prodlim r-RankAggreg r-Rlab r-survival
</pre>
<hr>
<h2>Running R Program</h2>
<ol>
<li>transfer programs and data to cluster</br>
<strong>/share/$GROUP/$USER/</strong> (Shared Space = Larger Quota)</li>
<li>See: <a href="https://hpc.ncsu.edu/Documents/CopyFiles.php">https://hpc.ncsu.edu/Documents/CopyFiles.php</a></li>
<li>ssh UNITYID@login.hpc.ncsu.edu</li>
<pre>$ cd /share/$GROUP/$USER/
$ ls
$ cp /usr/local/apps/samples/guide/weather.R .     (Example Program)
$ ls
$ conda activate env_R421
$ which Rscript
$ bwsubmit 1 Rscript weather.R</li>
$ bjobs</li>
$ ls weather.pdf</li>
$ less weather.*.out
$ less run_weather.tcsh
</pre>
</ol>
<hr>
<h2>R Package Administration</h2>
<pre>$ R-ProgramCheck weather.R
$ R-PkgCheck akima
$ conda install -y r-akima   (Add r- to name of R package)
$ R-Pkgcheck akima 
</pre>
<p>Occasionally you may <strong>not</strong> be able to install an R package.  When this occurs send an email to <a href="mailto:oit_hpc@help.ncsu.edu">oit_hpc@help.ncsu.edu</a> and ask for assitance. They may ask you to recreate your anaconda R environment using different parameters.</p>
