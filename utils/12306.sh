# 安装 Python >= 3.6
wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# 按照指示一路向下
# 重启终端

# 安装打码服务
git clone https://github.com/pjialin/12306-ocr
cd 12306-ocr && pip install -r requirements.txt
cp config.toml.example config.toml
nohup python main.py &

## 如果出现报错：ImportError: libSM.so.6: cannot open shared object file: No such file or directory
## sudo apt-get install libsm6 libxrender1 libfontconfig1

cd ..

# 安装主程序
git clone https://github.com/pjialin/py12306
cd py12306 && pip install -r requirements.txt
cp env.py.example env.py

# python main.py 运行购票程序