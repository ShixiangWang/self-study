# 梯度下降与学习率

data(iris)
Y = matrix(iris[, 1])
X = matrix(seq(0, 149, 1))

# 线性回归结果参考 ---------------
olsExample = function(y = Y, x = X) {
  y_h = lm(y ~ x)
  y_hf = y_h$fitted.values
  error = sum((y_hf - y)^2)
  coefs = y_h$coef
  output = list("Cost" = error, "Coef" = coefs)
  return(output)
}

olsExample(Y, X)
# $Cost
# [1] 49.69214
# $Coef
# (Intercept)           x 
#  4.82567770  0.01365981 

# 固定学习率的梯度下降法 ------------
gradientDescent = function(y = Y, x = X, alpha = 1e-4, epsilon = 1e-6, maxiter = 3e5) {
  # Intializing Parameters
  theta0 = 0
  theta1 = 0
  cost = sum(((theta0 + theta1 * x) - y)^2)
  converged = FALSE
  iterations = 1

  # Gradient Descent Algorithm
  while(!converged) {
    gradient0 = as.numeric((1 / length(y)) * sum((theta0 + theta1 * x) - y))
    gradient1 = as.numeric((1 / length(y)) * sum((((theta0 + theta1 * x) - y) * x)))
    
    t0 = as.numeric(theta0 - (alpha * gradient0))
    t1 = as.numeric(theta1 - (alpha * gradient1))

    theta0 = t0
    theta1 = t1

    error = as.numeric(sum(((theta0 + theta1 * x) - y)^2))
    
    if (is.infinite(abs(cost - error))) stop("The result does not converge!")
    if (as.numeric(abs(cost - error)) <= epsilon) converged = TRUE

    cost = error
    iterations = iterations + 1
    if (iterations == maxiter) converged = TRUE
  }

  output = list("theta0" = theta0, "theta1" = theta1, "Cost" = cost, "Iterations" = iterations)
  return(output)
}

gradientDescent(Y, X, alpha = 0.0002)
gradientDescent(Y, X)

# 自适应学习率的梯度下降法 ------------

adaptiveGradient = function(y = Y, x = X, alpha = 1e-4, epsilon = 1e-6, maxiter = 3e5) {
  
}