# Copyright 2020 Azade Farshad
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

num=0;
res_dir='./MyClevr';

mkdir -p $res_dir"/target/images";
mkdir -p $res_dir"/target/scenes";
mkdir -p $res_dir"/source/images";
mkdir -p $res_dir"/source/scenes";

for j in */; do 
find $(pwd)/$j"images" -iname "*_target.png" | sort -u | while read p; do
  cp $p $res_dir"/target/images/$num.png";
  cp ${p/target/"source"} $res_dir"/source/images/$num.png";
  q=$(pwd)/$j"scenes/${p##*/}"
  q="${q%%.*}.json"
  cp $q $res_dir"/target/scenes/$num.json";
  cp ${q/target/"source"} $res_dir"/source/scenes/$num.json";
  num=$((num+1))
  echo $p;
  echo ${p/target/"source"};
  echo $q;
  echo ${q/target/"source"};
  echo $num;
done
num=`expr $(ls -1 "$res_dir/target/images/" | wc -l)`;
done

# if there is depth maps folder arrange them as well.

mkdir -p $res_dir"/target/depth";
mkdir -p $res_dir"/source/depth";

for j in */; do 
find $(pwd)/$j"images" -iname "*_target_depth.png" | sort -u | while read p; do
  cp $p $res_dir"/target/depth/$num.png";
  cp ${p/target/"source"} $res_dir"/source/depth/$num.png";
  # q=$(pwd)/$j"scenes/${p##*/}"
  num=$((num+1))
  echo $p;
  echo ${p/target/"source"};
  echo $num;
done
num=`expr $(ls -1 "$res_dir/target/depth/" | wc -l)`;
done

rmdir $res_dir"/target/depth" 2> /dev/null
rmdir $res_dir"/source/depth" 2> /dev/null