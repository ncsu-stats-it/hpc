<h1>PLEASE....DO NOT USE</h1>
This was setup back in August of 2022.  Since then the OIT cluster has changed and they don't appreciate the use of this configuration/scripts.<br>
&nbsp;<br>
As of Jan 2023, OIT are no longer using the .tcshrc as the user default environment.  Therefore all the scripts here are not valid.  I should <strong>DELETE</strong> all this information.  However I'm wanting to keep it as reference point in case I need to establish something similar in the future.<br>
&nbsp;<br>
Sorry if you are still referencing it.<br>
-Terry-
<hr> 
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
$ echo $GROUP
  (If something is displayed other than statistics then you may not be able to completed the remaining steps, email: tbyron@ncsu.edu)
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
(env_R421)$ which Rscript
(env_R421)$ bwsubmit 1 Rscript weather.R</li>
(env_R421)$ bjobs</li>
(env_R421)$ ls weather.pdf</li>
(env_R421)$ less weather.*.out
(env_R421)$ less run_weather.tcsh
</pre>
</ol>
<hr>
<h2>R Package Administration</h2>
<pre>$ conda activate env_R421
(env_R421)$ R-ProgramCheck weather.R
(env_R421)$ R-PkgCheck akima
(env_R421)$ conda search r-akima
[This will take some time to search the Anconda sources]
(env_R421)$ conda install -y r-akima   (Add r- to name of R package)
(env_R421)$ R-Pkgcheck akima
</pre>
If the package is <strong>not</strong> found with <strong><em>conda search</em></strong>, then you install via R
<pre>(env_R421)$ R
> install.packages(c("face"))
> library("face")
> q()
(env_R421)$ cd /share/$GROUP/$USER/
(env_R421)$ bsub run_weather.tcsh 
</pre>
<p>Occasionally you may <strong>not</strong> be able to install an R package.  When this occurs send an email to <a href="mailto:oit_hpc@help.ncsu.edu">oit_hpc@help.ncsu.edu</a> and ask for assitance. They may ask you to recreate your anaconda R environment using different parameters.</p>
