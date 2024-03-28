from ubuntu

ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

run apt update

run apt install libeigen3-dev libopencv-dev -y

run apt install git build-essential -y

run git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git ORB_SLAM3

run apt install cmake -y

run apt install liboost-all-dev -y

run git clone --recursive https://github.com/stevenlovegrove/Pangolin.git

run cd Pangolin

run sed -i '$ s/$/ -y/' ./scripts/install_prerequisites.sh && ./scripts/install_prerequisites.sh

run cmake -B build && cmake --build build

run cmake --install build

run cd ..

run cd ORB_SLAM3 && chmod +x build.sh && ./build.sh