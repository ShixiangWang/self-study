# Data science workflow
# 1. Import
# 2. Tidy
# 3.1 Transform
# 3.2 Visualise
# 3.3 Model
# 4 Communicate



# Data import -------------------------------------------------------------

read.table("r/test1.csv")
test1 <- read.table(
  "r/test1.csv",
  header = TRUE,
  sep = ","
)
str(test1)

test1_2 <- read.csv("r/test1.csv")

all.equal(test1, test1_2)

read.csv3 <- function(file,
                      header = TRUE,
                      ...) {
  read.table(
    file,
    header = header,
    sep = ",",
    ...
  )
}

test1_3 <- read.csv3("r/test1.csv")

all.equal(test1_2, test1_3)

# .txt
# \t

test1_4 <- readr::read_csv(
  "r/test1.csv"
)

str(test1_4)

test1_5 <- readr::read_csv(
  "r/test1.csv",
  col_types = readr::cols()
)

identical(test1_4, test1_5)

#read.tsv
readr::read_tsv()

# tibble
class(test1)
class(test1_5)

test1
test1_5

test1$score <- as.character(test1$score)
test1
str(test1)
test1_5$score <- as.character(test1_5$score)
test1_5

#data.frame()
#dplyr::tibble()


# Data export -------------------------------------------------------------

write.table(
  test1,
  file = "r/test.txt",
  sep = "\t"
)

write.table(
  test1,
  file = "r/test.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)

readr::read_tsv("r/test.txt")

library(readr)
#read_

read_delim("r/test1.xx", delim = " ABC ")

x <- read_lines("r/test1.xx")
gsub(" ABC ", ",", x)

x2 <- read_file("r/test1.xx")

x
x2

readr

# data tidy ---------------------------------------------------------------

library(tidyverse)
mtcars

## 管道 %>%  
# Unix |
sum(1:10)
1:10 %>% sum

# f2(f1(a))
# a %>% f1() %>% f2()

## 描述
summary(mtcars)
glimpse(mtcars)

## 取子集
mtcars %>% 
  filter(gear == 4)

mtcars %>% 
  filter(gear == 4) %>% 
  nrow()

nrow(filter(mtcars, gear == 4))

colnames(mtcars)

mtcars %>% 
  select(mpg, cyl)

## 集合操作

a <- c("A", "B", "C")
b <- c("B", "C", "D")

intersect(a, b)
union(a, b)
setdiff(a, b)
setdiff(b, a)
setequal(a, b)

data1 <- mtcars %>% 
  select(mpg, cyl) %>% 
  head(4)
data1

data2 <- mtcars %>% 
  select(mpg, cyl) %>% 
  slice(2:5)
data2

data1[2:4,]
intersect(data1, data2)

## 连接操作 join
# 数据库
test1
test2 <- data.frame(
  stu = c("B", "C", "D"),
  class = c("a", "b", "c")
)

test1
test2

full_join(
  test1,
  test2,
  by = "stu"
)

left_join(
  test1,
  test2,
  by = "stu"
)
test1

right_join(
  test1,
  test2,
  by = "stu"
)

semi_join(
  test1,
  test2,
  by = "stu"
)

anti_join(
  test1,
  test2,
  by = "stu"
)

?merge

## 列修改
test1 %>% 
  mutate(
    class = c("a", "b", "c")
  )

test1 %>% 
  mutate(
    stu = c("a", "b", "c")
  )

test1 %>% 
  transmute(
    stu = c("a", "b", "c")
  )

## 排序
test1 %>% 
  arrange(score)

test1 %>% 
  arrange(desc(score))

## 计数
test1 %>% 
  count(stu)

## 记录添加
test1 %>% 
  add_row(stu = "D", score = "100")

## 分组计算

mtcars %>% 
  group_by(gear) %>% 
  summarise(
    wt_mean = mean(wt)
  )

mtcars %>% 
  group_by(gear) %>% 
  summarise_each(
    list(
      mean = mean,
      sd = sd
    )
  )

mtcars %>% 
  group_by(gear, vs) %>% 
  summarise(
    wt_mean = mean(wt)
  )


## 数据变换
cumsum(1:10)

test1 %>% 
  mutate(
    rowid = row_number()
  )

# Apply -------------------------------------------------------------------
# R 的 for 循环效率比较低
# 其实，这是错误的概念

apply # 针对矩阵、数据框
lapply # 列表
sapply # 列表

## 基因表达矩阵
expr <- matrix(
  rnorm(1000),
  100, 10, 
  dimnames = list(
    paste0("Gene", 1:100),
    paste0("Sample", 1:10)
  ) 
)

mean2 <- function(...) {
  mean(...)
}

apply(expr, 1, mean)
apply(expr, 2, mean)
rowMeans(expr)
identical(
  apply(expr, 1, mean),
  rowMeans(expr)
)

identical(
  apply(expr, 1, mean2),
  rowMeans(expr)
)

a_list <- list(
  1:10,
  2:5,
  3
)

str(a_list)
lapply(a_list, mean)
sapply(a_list, mean) # simplified lapply
?tapply
?mapply


# GGplot2 -----------------------------------------------------------------
# https://www.bilibili.com/video/BV1wk4y1m7rn


