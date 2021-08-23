 #!/bin/bash

 cd 
 mkdir urho3d && cd ./urho3d
 git clone https://github.com/urho3d/Urho3D.git
 chmod 777 -R ./Urho3D
 cd ./Urho3D
 mkdir build
 script/cmake_arm.sh  ./build/ -DURHO3D_ANGELSCRIPT=0  -DARM=1 -DURHO3D_DEPLOYMENT_TARGET=native
 cd build 
 make && make install