# 分布函数
# d 概率密度函数
# p 累积密度函数
# q 分位数
# r 生成符合某个分布的随机数据
rnorm(100)
hist(rnorm(100))

require(graphics)


## Using "log = TRUE" for an extended range :
par(mfrow = c(2,1))
plot(function(x) dnorm(x, log = TRUE), -60, 50,
     main = "log { Normal density }")
curve(log(dnorm(x)), add = TRUE, col = "red", lwd = 2)
mtext("dnorm(x, log=TRUE)", adj = 0)
mtext("log(dnorm(x))", col = "red", adj = 1)

plot(function(x) pnorm(x, log.p = TRUE), -50, 10,
     main = "log { Normal Cumulative }")
curve(log(pnorm(x)), add = TRUE, col = "red", lwd = 2)
mtext("pnorm(x, log=TRUE)", adj = 0)
mtext("log(pnorm(x))", col = "red", adj = 1)

# 线性回归
library(tidyverse)

re <- read_csv("r/data/real-estate.csv")

lmfit <- lm(Price ~ Size, data = re)
lmfit

summary(lmfit)

# Price = -113509 + 283 * Size
coef(lmfit)[1]
coef(lmfit)[2]

confint(lmfit)
AIC(lmfit) # 赤池信息准则
BIC(lmfit) # 贝叶斯信息准则

residuals(lmfit)
vcov(lmfit)

# 检查数据分布是否服从正态分布
shapiro.test(residuals(lmfit)) # 不服从

shapiro.test(rnorm(100, mean = 5, sd = 3))

par(mfrow = c(2, 2))
plot(lmfit)

layout(c(1))

plot(re$Size, re$Price)
abline(lmfit)


test_size = tibble(
  Size = c(2000, 4000, 8000)
)
test_size

predict(lmfit, test_size)
predict(lmfit)
lmfit$fitted.values

all.equal(as.numeric(predict(lmfit)),
as.numeric(lmfit$fitted.values))

p <- ggplot(re, aes(Size, Price)) +
  xlab('Size (SQ. ft)') +
  ylab('Price (U.S. dollar)') +
  geom_point(color='black') +
  geom_smooth(method='lm', se=F) +
  theme(text=element_text(size=20))
print(p)

glimpse(re)

# 多元线性回归
summary(lm(Price ~ Size + Bedrooms, data = re))
summary(lm(Price ~ Size:Bedrooms, data = re))
summary(lm(Price ~ Size + Bedrooms + Size:Bedrooms, data = re))
summary(lm(Price ~ Size*Bedrooms, data = re))

# y = beta0 + beta1 * x^2
summary(lm(Price ~ I(Size^2), data = re))

# y = beta0 + beta1 * x + (error)
summary(lm(Price ~ Size, data = re))
# y = beta1 * x + (error)
summary(lm(Price ~ Size - 1, data = re))

# .
str(re)
summary(lm(Price ~ ., data = re))

# modeling
# caret
# link: https://blog.csdn.net/guolindonggld/article/details/87856780
# https://www.jianguoyun.com/p/DdHDkYMQ6uuVCBiar9wD
nrow(re)

