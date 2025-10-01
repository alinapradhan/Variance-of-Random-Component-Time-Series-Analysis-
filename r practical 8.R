#PRACTICAL 8 
## calculation of variance of random component by variance difference method 
##load necessary libraries

install.packages("TTR")
install.packages("forecast") 
library(TTR) #for sma 
library(forecast)# for auto arima

##example time series (quarterly data)
ts_data <- ts(c(100,102,101,104,108,110,111,115,118,120,119,123),
              frequency=4)
ts_data

##length of the data 
n <- length(ts_data)
n

#1. classical decomposition 
decomposed <- decompose(ts_data, type="additive")
decomposed
var_decompose <- var(decomposed$random, na.rm=TRUE)
var_decompose

#2. regression residual 
time  <-1:n
model <- lm(ts_data ~ time)
var_regression <- var(resid(model))

#3 moving average 

ma = SMA(ts_data,n=4)
ma
random_ma <- ts_data - ma
random_ma
var_moving_average <- var(random_ma,na.rm=TRUE)
var_moving_average


##4. DIFFERENCING METHOD 
diff_ts <- diff(ts_data)
diff_ts
var_diff <- var(diff_ts,na.rm=TRUE)
var_diff

## 5.ARIMA rESIDUAL 
library(forecast)# for auto arima
fit <- auto.arima(ts_data)
var_arima <- var(residuals(fit))
var_moving_average
var_arima
fit



#### 6 variable difference method 
d1 <- diff(ts_data,lag=1)
d1
d2 <- diff(ts_data,lag=2)
d2
d3 <- diff(ts_data,lag=3)
d3


k1<-6/11
k1
k2<-3/11
k2
k3<- 2/11
k3

# align lengths by trimming NA values
d2 <- d2[-1]
d2
d3 <- d3[-c(1,2)]
d3


var_variate <- sum(k1*d1[-c(1:2)]^2 + k2*d2^2 + k3*d3^2)/length(d3)
var_variate

## combine results 
result <- data.frame(
  Method = c("Decomposition","Regression Residuals","Moving Average","Arima Residuals", "Differencing", "Variate Difference"),
  Variance = c(var_decompose,var_regression,var_moving_average,var_diff,var_arima,var_variate)
)
result

