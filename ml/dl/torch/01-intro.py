# source: https://pytorch.apachecn.org/docs/1.4/blitz/tensor_tutorial.html

# Run in R start
# reticulate::use_python("/Users/wsx/Library/r-miniconda/bin/python", required = T)
# reticulate::repl_python()
# Run in R end

from __future__ import print_function
import torch

# TENSOR ----------------------

# Empty tensor
x = torch.empty(5, 3)
print(x)

# Random tensor
x = torch.rand(5, 3)
print(x)


# Zero matrix with long data type
x = torch.zeros(5, 3, dtype=torch.long)
print(x)

# Construct tensor from data
x = torch.tensor([5, 3])
print(x)

# Construct tensor based on tensor
x = x.new_ones(5, 3, dtype=torch.double)      # new_* methods take in sizes
print(x)

x = torch.randn_like(x, dtype=torch.float)    # 重载 dtype!
print(x)                                      # 结果size一致

# Shape of tensor
print(x.size())

# OPERATIONS ---------------

# +
y = torch.rand(5, 3)
print(x + y)
print(torch.add(x, y))

result = torch.empty(5, 3)
torch.add(x, y, out=result)  # The output tensor is given
print(result)

y.add_(x) # Add in place
print(y)
# More in-place modification functions are end with '_'

# Index
print(x[:, 1])

# Change shape
x = torch.randn(4, 4)
y = x.view(16)
z = x.view(-1, 8)  # the size -1 is inferred from other dimensions
print(x.size(), y.size(), z.size())

# Transform one-element tensor to scalar
x = torch.randn(1)
print(x)
print(x.item())

# More available at <https://pytorch.org/docs/stable/torch.html>

# CONNECT to NumPy -----------------
a = torch.ones(5)
print(a)
a.numpy()

# b is a reference
b = a.numpy()
print(b)
a.add_(1)
print(a)
print(b)

# ndarray to tensor
import numpy as np
a = np.ones(5)
b = torch.from_numpy(a)
np.add(a, 1, out=a)
print(a)
print(b)

# CPU上的所有张量(CharTensor除外)都支持与Numpy的相互转换。

# TENSOR in CUDA -----------------
# 当GPU可用时,我们可以运行以下代码
# 我们将使用`torch.device`来将tensor移入和移出GPU
if torch.cuda.is_available():
    device = torch.device("cuda")          # a CUDA device object
    y = torch.ones_like(x, device=device)  # 直接在GPU上创建tensor
    x = x.to(device)                       # 或者使用`.to("cuda")`方法
    z = x + y
    print(z)
    print(z.to("cpu", torch.double))       # `.to`也能在移动时改变dtype

# PyTorch中，所有神经网络的核心是 autograd 包。
# 先简单介绍一下这个包，然后训练我们的第一个的神经网络。
#
# autograd 包为张量上的所有操作提供了自动求导机制。
# 它是一个在运行时定义(define-by-run）的框架，
# 这意味着反向传播是根据代码如何运行来决定的，并且每次迭代可以是不同的。

# torch.Tensor 是这个包的核心类。如果设置它的属性 .requires_grad 为 True，
# 那么它将会追踪对于该张量的所有操作。当完成计算后可以通过调用 .backward()，
# 来自动计算所有的梯度。这个张量的所有梯度将会自动累加到.grad属性.
#
# 要阻止一个张量被跟踪历史，可以调用 .detach() 方法将其与计算历史分离，
# 并阻止它未来的计算记录被跟踪。
#
# 为了防止跟踪历史记录(和使用内存），可以将代码块包装在 with torch.no_grad(): 中。
# 在评估模型时特别有用，因为模型可能具有 requires_grad = True 的可训练的参数，
# 但是我们不需要在此过程中对他们进行梯度计算。
#
# 还有一个类对于autograd的实现非常重要：Function。
#
# Tensor 和 Function 互相连接生成了一个无圈图(acyclic graph)，
# 它编码了完整的计算历史。每个张量都有一个 .grad_fn 属性，
# 该属性引用了创建 Tensor 自身的Function
# (除非这个张量是用户手动创建的，即这个张量的 grad_fn 是 None )。
#
# 如果需要计算导数，可以在 Tensor 上调用 .backward()。
# 如果 Tensor 是一个标量(即它包含一个元素的数据），
# 则不需要为 backward() 指定任何参数，但是如果它有更多的元素，
# 则需要指定一个 gradient 参数，该参数是形状匹配的张量。

import torch

x = torch.ones(2, 2, requires_grad=True)
print(x)