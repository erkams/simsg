pip install -r /mnt/nfs-students/requirements.txt
git clone --branch clip-embedding https://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@github.com/erkams/simsg.git 
cd simsg
echo $PWD > /usr/local/lib/python3.10/dist-packages/simsg.pth 
cp -f /mnt/nfs-students/modeling_clip.py /usr/local/lib/python3.10/dist-packages/transformers/models/clip/modeling_clip.py
python scripts/run_train.py args_64_spade_clevr_clip_cluster.yaml --gconv_dim=1024 --embedding_dim=1024



sudo apt install -y python3.10-venv
python3 -m venv env
source ./env/bin/activate
pip install -r /mnt/nfs-students/requirements.txt
pip show transformers
git clone --branch clip-embedding https://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@github.com/erkams/simsg.git
cd simsg
sudo echo $PWD > /home/sekererkam/env/lib/python3.10/site-packages/simsg.pth
cp -f /mnt/nfs-students/modeling_clip.py /home/sekererkam/env/lib/python3.10/site-packages/transformers/models/clip/modeling_clip.py
mkdir -p /mnt/nfs-students/experiments/clevr_clip
python scripts/run_train.py args_64_spade_clevr_clip_cluster.yaml --gconv_dim=1024 --embedding_dim=1024