git clone https://github.com/AlexeyAB/darknet

cd darknet/
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/LIBSO=0/LIBSO=1/' Makefile

make

cd data/
find -maxdepth 1 -type f -exec rm -rf {} \;
cd ..

rm -rf cfg/
mkdir cfg

mv ./yolov4-custom.cfg cfg

cd cfg
sed -i 's/batch=64/batch=1/' yolov4-custom.cfg
sed -i 's/subdivisions=16/subdivisions=1/' yolov4-custom.cfg
cd ..

mv ./obj.names data
mv ./obj.data  data

cd ..
mkdir uploads

mkdir model
gdown --id 1QSdGg7RM0rMrp2zWdjMoAQ9r0Vs71oVL
mv ./yolov4-custom_best.weights model