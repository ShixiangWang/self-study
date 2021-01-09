# Construct a vector
c() # Combine
c(1, 2, 3)

multi <- c(1, "A", TRUE)
multi

c(1, TRUE)
c(1, FALSE)

1 
1L
is.integer(c(1, 1L))
is.integer(c(2L, 1L))

seq(1.1, 20.1, by = 1.1)

rep("A", 10)
rep(TRUE, 10)

length(rep("A", 10))

# Construct a matrix
m1 <- matrix(
  data = 1:12, 
  nrow = 3,
  ncol = 4)

m1 <- matrix(1:12, 3, 4)
m1

m1 <- matrix(1:12, 3, 4,
       dimnames = list(
         c("A", "B", "C"),
         c("a", "b", "c", "d")
       ))

matrix(1:12, 3, 4, byrow = TRUE)

m1

dim(m1)  # dimension
nrow(m1)
ncol(m1)

dimnames(m1)
rownames(m1)
colnames(m1)

m1[1, 3]
m1[1, ]
m1[2, ]
m1[, 2]
m1[1:2, 1:2]
m1[c(1, 3), 1:2]

dim(m1)  # dimension
dim(m1) <- c(2, 6)
m1

nrow(m1)
nrow(m1) <- 1
ncol(m1)
ncol(m1) <- 2

m1 <- matrix(1:12, 3, 4,
             dimnames = list(
               c("A", "B", "C"),
               c("a", "b", "c", "d")
             ))
dimnames(m1)
rownames(m1)
colnames(m1)


# Construct an array
ar <- array(
  1:12,
  c(2, 3, 4)
)
ar
ar[2, 2, 1]

# Construct a list
c(1, TRUE, "A")
list(1, TRUE, "A")

a_list <- list(
  c(1, 2),
  matrix(1:12, 3, 4),
  list(1, 2, TRUE)
)

a_list[[1]] # 取元素
a_list[1]   # 取子集

names(a_list)
names(a_list) <- c("a", "b", "c")
a_list

a_list$a
a_list[[1]]

a_vec <- 1:10
names(a_vec) <- letters[1:10]
a_vec

a_vec[2]
a_vec['b']

# Construct a data.frame
stu <- LETTERS[1:4]
height <- c(172, 168, 155, 180)
score <- 92:95
pass <- TRUE

student <- data.frame(
  name = stu,
  height = height,
  score = score,
  pass = pass
)

student

is.list(student)
is.data.frame(student)

data.frame(
  name = stu,
  height = c(height, 199),
  score = score,
  pass = pass
)

c(1, 2, 3, 4) > 1
#
c(1, 2, 3, 4) > c(1, 1, 1, 1)
c(1, 2, 3, 4) > c(1, 1, 1, 1, 1)

student
student$score
student[1:2, ]
student[, c("score", "pass")]

rownames(student)
student[c("1", "2"), ]

# Construct a factor
sex <- sample(
  c("Male", "Female"),
  100,
  replace = TRUE
)

sex <- c(sex, "others")
sex

fsex <- factor(
  sex,
  levels = c("Male", "Female")
)

fsex
str(fsex)

factor(
  sex
)

sex <- sample(
  c("A", "B"),
  100,
  replace = TRUE
)
sex

fsex <- factor(
  sex,
  levels = c("Male", "Female")
)

fsex

fsex <- factor(
  sex,
  levels = c("A", "B"),
  labels = c("Male", "Female")
)

str(fsex)

# low, mid, high
# why ordered?

# datetime
"2016" > "2015"
str()

"B" - "A"
as.Date("2015-06-01") - as.Date("2015-05-29")

c(1, TRUE)

as.integer(TRUE)

#is.*
as.integer("3")
as.character(3L)
#as.*

student <- data.frame(
  name = stu,
  height = height,
  score = score,
  pass = pass
)
student

student2 <- student[1:2, ]
student3 <- student[3:4, ]

student2
student3

# row bind
rbind(student2, student3)

student_1 <- student[, 1:2]
student_2 <- student[, 3:4]

student_1
student_2

# column bind
cbind(student_1, student_2)

# Special constants

# basic types
1.0
1L
TRUE
"1"

NULL # 空值
NA   # Not Available 缺失值
NaN  # Not a number 无法表示的值
Inf  # 无穷大
+Inf
-Inf
 
student$score[2] <- NA
student

student$pass <- NULL
student

sum2 <- function(x) {
  s <- 0
  for (i in x) {
    s <- s + i
  }
  return(s)
}

sum2(1:10)

sum3 <- function(x) {
  s <- 0
  
  for (i in x) {
    s <- s + i
  }
  return(s)
}

sum3(1:10)

a <- 1
b <- 2
