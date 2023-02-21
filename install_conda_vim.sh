curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh -b -p `pwd`/conda
. `pwd`/conda/etc/profile.d/conda.sh

export PYTHONNOUSERSITE=1
python_version=$(python3 -c "import platform;print(platform.python_version())")
buildenv=`pwd`/buildenv
conda create python=${python_version} vim --prefix $buildenv -y

mkdir -p install/bin
for v in $buildenv/bin/vim*
do
  bin=install/bin/`basename $v`
  echo ". `pwd`/conda/etc/profile.d/conda.sh" > $bin
  echo "conda activate $buildenv" >> $bin
  echo $v '"$@"' >> $bin
  chmod +x $bin
done

