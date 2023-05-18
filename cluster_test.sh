sudo apt install -y python3.10-venv
python3 -m venv env
source ./env/bin/activate
pip install -r /mnt/nfs-students/requirements.txt
pip show transformers
git clone --branch clip-embedding https://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@github.com/erkams/simsg.git
cd simsg
sudo echo $PWD > /home/sekererkam/env/lib/python3.10/site-packages/simsg.pth
cp -f /mnt/nfs-students/modeling_clip.py /home/sekererkam/env/lib/python3.10/site-packages/transformers/models/clip/modeling_clip.py
python scripts/evaluate_changes_clevr.py --exp_dir /mnt/nfs-students/experiments/clevr_clip --experiment spade_64_clevr_clip