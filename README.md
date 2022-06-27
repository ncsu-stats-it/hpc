<h1>HPC</h1>
The folowing will setup your base R-environment and the minimal packages you will need to start running R simulations on the NCSU HPC linux cluster.
https://hpc.ncsu.edu/main.php<br>
&nbsp;<br>
<hr>
<pre>ssh UNITYID@login.hpc.ncsu.edu
$ git clone https://github.com/ncsu-stats-it/hpc
$ cd hpc
$ git config merge.defaultToUpstream true
$ sh ./install-hpc-env
$ sh ./bin/R-env
$ cd
$ source ~/.tcshrc
$ which R
</pre>
<hr>
<h2>Updated R</h2>
Periodically a new version of R will be release.<br>
<pre>R-ScriptsUpdate
exit
ssh UNITYID@login.hpc.ncsu.edu</pre>
<hr>
<h2>Running R Program</h2>
<ol>
<li>transfer programs and data to cluster</br>
<strong>/share/statistics/$USER/</strong> (Shared Space = Larger Quota)</li>
<li>See: <a href="https://hpc.ncsu.edu/Documents/CopyFiles.php">https://hpc.ncsu.edu/Documents/CopyFiles.php</a></li>
<li>ssh UNITYID@login.hpc.ncsu.edu</li>
<li>cd /share/statistics/$USER/</li>
<li>ls</li>
<li>cp /usr/local/apps/samples/guide/weather.R .
<li>ls</li>
<li>bwsubmit 1 Rscript weather.R</li>
<li>bjobs</li>
<li>ls weather.pdf</li>
<li>less submit_weather.o</li>
<li>less submit_weather.tcsh</li>
<li><strong>[Repeat Option-1 (2 Cores)]</strong>
<li>{modify} submit_weather.tcsh</li>
<li>$ qsub submit_weather.tcsh</li>
<li><strong>[Repeat Option-2 (2 Cores)]</strong>
<li>bwsubmit 2 Rscript weather.R</li>
</ol>
<hr>
<h2>R Package Administration</h2>
<ul>
<li>R-ProgramCheck weather.R</li>
<li>R-PkgCheck robustHD</li>
<li>R-PkgInstall robustHD</li>
<li>R-Pkgcheck robustHD</li>
</ul>
<p>Occasionally you will <strong>not</strong> be able to install an R package.  When this occurs send an email to <a href="mailto:oit_hpc@help.ncsu.edu">oit_hpc@help.ncsu.edu</a> and ask to have the package installed.  This happens when a OS library/file is needed for the R package.</p>
