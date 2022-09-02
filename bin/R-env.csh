if ( "$1" == "" ) then      
    set R_ENV="env_R421"
else
     set R_ENV="$1"
endif
echo "Setting up conda R environment: $R_ENV"
cd /usr/local/usrapps/$GROUP/$USER
conda create -y --no-default-packages --prefix=/usr/local/usrapps/$GROUP/$USER/$R_ENV
conda env list
echo "Activating conda R environment"
conda activate /usr/local/usrapps/$GROUP/$USER/$R_ENV
conda install -y -c conda-forge python=3.10.6 gfortran=12.1.0 gcc=12.1.0 r-base=4.2.1 r-devtools 
# conda install -y -c bioconda bioconductor-biocinstaller
