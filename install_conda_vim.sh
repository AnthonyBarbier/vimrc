curl -o micromamba -L -O "https://github.com/mamba-org/micromamba-releases/releases/download/1.5.6-0/micromamba-linux-64"
# or micromamba-aarch64
chmod +x micromamba

export PYTHONNOUSERSITE=1
export MAMBA_ROOT_PREFIX=`pwd`
python_version=$(python3 -c "import platform;print(platform.python_version())")
buildenv=`pwd`/buildenv
micromamba=`pwd`/micromamba
$micromamba create -c conda-forge python=${python_version} vim gh tree tig loki-logcli --prefix $buildenv -y
mkdir -p install/bin
for v in $(ls $buildenv/bin/vim* $buildenv/bin/gh $buildenv/bin/tree $buildenv/bin/tig $buildenv/bin/logcli)
do
  bin=install/bin/`basename $v`
  echo "" > $bin
  echo "$micromamba run -p $buildenv $v \"\$@\"" >> $bin
  chmod +x $bin
done
# Could make them all the same and only base it on the name
# cmd=$(basename $0)
# /nethome/anthonyb/.vim/micromamba run -p /nethome/anthonyb/.vim/buildenv /nethome/anthonyb/.vim/buildenv/bin/${cmd} "$@"
