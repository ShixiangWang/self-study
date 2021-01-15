# 深度学习

## 动手学深度学习 —— PyTorch 版本

- <https://d2l.ai/index.html>
- [目录](d2l)

### 安装

```sh
conda create --name d2l python=3.8 -y
conda activate d2l
pip install torch torchvision -f https://download.pytorch.org/whl/torch_stable.html
# -U: Upgrade all packages to the newest available version
pip install -U d2l
```
上面的环境安装可以跳过。

启动：

```sh
jupyter notebook
```

### 测试（CPU 版本）

```python
import torch
torch.__version__
```

## Torch 教程

- [目录](torch)

