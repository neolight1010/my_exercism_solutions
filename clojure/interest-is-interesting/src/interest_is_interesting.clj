(ns interest-is-interesting)

(defn abs
  [x]
  (if (pos? x) x (- x)))

(defn normalized-percentage
  [percentage]
  (/ percentage 100M))

(defn interest-rate
  "Calculate the interest rate for a given balance"
  [balance]
  (cond
    (< balance 0) -3.213
    (< balance 1000) 0.5
    (< balance 5000) 1.621
    :else 2.475))

(defn annual-balance-update
  "Calculate the updated balance with the corresponding interest rate"
  [balance]
  (let
   [normalized-interest-rate (normalized-percentage (bigdec (interest-rate balance)))
    earned-interest (* (abs balance) normalized-interest-rate)]

    (bigdec (+ balance earned-interest))))

(defn amount-to-donate
  "Calculate the amount to donate based on the balance and tax-free-percentage"
  [balance tax-free-percentage]
  (let
   [donation-rate (* (normalized-percentage tax-free-percentage) 2M)]

    (if (neg? balance) 0
        (int (* balance donation-rate)))))
