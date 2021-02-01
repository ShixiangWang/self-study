#!/usr/bin/env python3
# source: 《算法图解》

def quicksort(array):
  if len(array) < 2:
    return array
  else:
    pivot = array[0] # 如果随机选择一个数做基准值，平均效率更高
    less = [i for i in array[1:] if i <= pivot]
    greater = [i for i in array[1:] if i > pivot]
    return quicksort(less) + [pivot] + quicksort(greater)

print(quicksort([10, 5, 2, 1, 3]))