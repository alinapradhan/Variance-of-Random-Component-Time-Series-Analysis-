 
# Variance of Random Component (Time Series Analysis)

This repository contains R code for **calculating the variance of the random component in a time series** using different statistical methods, including the **variance difference method**.

--- 
  
##  Objective
To demonstrate multiple approaches for estimating the variance of the random component in a time series dataset, including:
- Classical decomposition
- Regression residuals
- Moving average method
- Differencing method
- ARIMA residuals
- Variance difference method

---

## Requirements
Make sure you have R installed. You will also need the following packages:

```r
install.packages("TTR")
install.packages("forecast")
````

---


---

## Methods Used

1. **Classical Decomposition**
   Breaks the series into trend, seasonal, and random components, then calculates the variance of the random part.

2. **Regression Residuals**
   Fits a linear trend and calculates the variance of residuals.

3. **Moving Average Method**
   Uses a simple moving average (SMA) to smooth the data and compute variance of the residuals.

4. **Differencing Method**
   Removes the trend using differencing and computes variance.

5. **ARIMA Residuals**
   Fits an ARIMA model (using `auto.arima`) and calculates variance of model residuals.

6. **Variance Difference Method**
   Applies weighted differencing (lag 1, lag 2, lag 3) to estimate variance.

---



3. The output will be a **data frame** showing variances from different methods:

   | Method               | Variance |
   | -------------------- | -------- |
   | Decomposition        | ...      |
   | Regression Residuals | ...      |
   | Moving Average       | ...      |
   | Differencing         | ...      |
   | ARIMA Residuals      | ...      |
   | Variance Difference  | ...      |

---

## Notes

* Example time series data is quarterly (12 values).
* You can replace `ts_data` with your own dataset for analysis.
* Make sure to align differencing lags correctly when applying the variance difference method.

---

##  License

This project is licensed under the MIT License – feel free to use and modify for learning or research purposes.

```

