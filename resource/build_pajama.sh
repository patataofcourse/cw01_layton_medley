#todo: msbdiff

cd resource 2> /dev/null || true
cd pajama 2> /dev/null || true

python ../../../sarc.py -zxf pajama.og.zlib
rm -rf pajama.og_
cp -f zlib/* arc
python ../../../sarc.py -zcf pajama.zlib arc/*
cp pajama.zlib ../../asset/USmessage