#####################################
#
# Install software on Linux servers
# 2025 Feb. 27th
#
# Code Contributor: Yue Yu
# Biodiversity Research Center, UBC
#
#####################################


# ----------------------------
# Step 0: Login your Linux server
# ----------------------------

# -- Lab server 
ssh username@servername

# -- Compute Canada
ssh username@cedar.computecanada.ca




# ----------------------------
# Step 1: Load existing software & version check
# ----------------------------

# -- Lab server
which python

python --version

python


# -- Compute Canada
module spider python/3.13.2

module load python/3.13.2

python



# ----------------------------
# Step 2: Understand $PATH
# ----------------------------
echo $PATH

export PATH=/home/yueyu/software/new_tool:$PATH




# ----------------------------
# Step 3: Install from source code - HMMER
# ----------------------------

#--  Download HMMER to your assigned directory
wget http://eddylab.org/software/hmmer/hmmer-3.4.tar.gz

#--  Decompress 
tar zxf ncbi-blast-2.16.1+-x64-linux.tar.gz

#-- Compiling the Source to your assigned directory generate a Makefile
cd hmmer-3.4
./configure --prefix /home/yueyu/software/HMMER/hmmer-3.4

#-- Interpret the program: with make
make

#-- Move binary executable files to the assigned directory
make install
cd bin
ls 


#-- Option 1: Run HMMER with full path
 ~/software/HMMER/hmmer-3.4/bin/hmmscan -h

#-- Option 2: Add full path to existing $PATH and run HMMER as shortcut
export PATH=/home/yueyu/software/HMMER/hmmer-3.4/bin:$PATH
echo $PATH

#-- Run HMMER directly
hmmscan -h



# ----------------------------
# Step optional: Install from binary - BLASTN
# ----------------------------

#--  Download BLAST source package
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.16.0+-x64-win64.tar.gz 

#--  Decompress 
tar zxvpf ncbi-blast-2.16.1+-x64-linux.tar.gz

#-- Option 1: Run BLASTN with full path (check -help)
~/software/ncbi-blast-2.16.0+/bin/blastn -help | head

#-- Option 2: Add full path to existing $PATH and run BLASTN as shortcut
export PATH= ~/software/ncbi-blast-2.16.0+/bin:$PATH
echo $ PATH

#-- Run BLASTN directly
blastn -help | head


# ----------------------------
# Step 4.1: Install from R - "ggplot2"
# ----------------------------

#-- Check R version
R –version

#-- Run R
R

#-- Check library path in R
.libPaths()


#-- Set library path in R
.libPaths("/home/yueyu/Rlibs")

#-- install packages in R
install.packages("ggplot2", lib="/home/yueyu/Rlibs")



# ----------------------------
# Step 4.2: Installation from Python – pixy
# using pip wheel install on Compute Canada 
# ----------------------------


# -- Install code
module load python/3.10
virtualenv --no-download --clear ~/ENV && source ~/ENV/bin/activate
pip install -U pip
pip wheel --no-deps git+https://github.com/ksamuk/pixy
pip install ./pixy-1.2.6b1-py3-none-any.whl 
python -c 'import pixy'
pip freeze > requirements.txt



# -- Activate code
module load python/3.10
virtualenv --no-download --clear ~/ENV && source ~/ENV/bin/activate
pip install --no-index --upgrade pip
pip install --no-index -r pixy-requirements.txt
python -c 'import pixy'



# ----------------------------
# Step 5: CONDA
# ----------------------------

# Starter Guide: https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html 






# END