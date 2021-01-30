
# 数据清洗 --------------------------------------------------------------------

# 删除处理

# 01.样本去重

stus <- data.frame(
  id = c(1, 2, 3, 3, 4, 4),
  gender = c("F", "M", "F", "F", "M", "F")
)
stus

dim(stus)

length(unique(stus$id))
length(unique(stus))

dim(unique(stus))

# 02.特征去重
stus <- data.frame(
  id = 1:3,
  gender = c("F", "M", "M"),
  grade = c(6, 6, 6),
  height = c(1.7, 1.9, 1.6)
)
stus

sapply(stus,
       function(x) length(unique(x)))


# %>% 管道符号
library(magrittr)
magrittr::`%>%`
library(dplyr)

# f(a)
# a %>% f()
sum(1:10)
1:10 %>% sum

library(caret)
nearZeroVar(stus)

nearZeroVar(stus, saveMetrics = TRUE)

stus <- data.frame(
  id = 1:3,
  gender = c("F", "M", "M"),
  grade = c(6+1e-30, 6+1e-32, 6+1e-35),
  height = c(1.7, 1.9, 1.6)
)
nearZeroVar(stus)
nearZeroVar(stus, saveMetrics = TRUE)
var(stus$grade)

# 03.缺失值处理
airquality
summary(airquality[, 1:4])
sum(is.na(airquality$Ozone))

library(mice)
md.pattern(airquality)

library(VIM)
aggr(airquality)
matrixplot(airquality)
#marginplot()

# 删除缺失值仅适合用于完全随机缺失的数据
na.fail(c(1, NA, 3))
na.omit(c(1, NA, 3))
na.exclude(c(1, NA, 3))
na.pass(c(1, NA, 3))

# 插补法
# 均值、中位数、众数
# 也仅限于随机缺失数据
# 如果不随机，该怎么办？

# 04.异常值处理
# 均值 3 个标准差之外

# 05. 采样

sample(1:10, 5, replace = TRUE)
sample(1:10, 5, replace = FALSE)

# error
sample(1:4, 5, replace = FALSE)

airquality
dplyr::sample_n(airquality, 10)

# 分层采样
iris_ <- iris[c(1:60, 101:130),]
iris_
ct <- table(iris_$Species)
ct

n <- round(as.numeric(ct) * 0.8)

s_i <- sampling::strata(
  iris_,
  stratanames = "Species",
  size = n,
  method = "srswor"
)
table(s_i$Species)


# 特征变换和编码 -----------------------------------------------------------------

# 无量纲化

# 01. 归一化
# 消除不同量纲下数据对最终结果的影响
normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

normalize(1:10)

# 02. 标准化
# 均值 0，标准差 1
# 又称 Z score
# 消除一开始变量具有不同影响程度的差异
# 最优化可以更快收敛

scale2 <- function(x) {
  (x - mean(x)) / sd(x)
}
sd(scale2(1:10))

?scale
scale(1:10)

# 离散化
price <- c(4, 8, 15, 21, 21, 24, 25, 28, 34)
# 等宽分箱（取值范围一致）
cut(price, breaks = 3)
# 等深分箱
Hmisc::cut2(price, g = 3)

length(price)
# NOTE:
Hmisc::cut2(c(4, 8, 15, 21, 21, 24, 25, 28, 34, 30), g = 3)
?Hmisc::cut2

# 哑变量化
# 也叫热编码 one-hot encoding
str(factor(c("F", "M", "F")))


# 特征提取 --------------------------------------------------------------------

# PCA
library(graphics)
pca <- prcomp(USArrests, scale. = TRUE)
summary(pca)

caret::nearZeroVar()
caret::findCorrelation()
caret::findLinearCombos()
caret::sbfControl()
caret::rfeControl()

#mlr3::



