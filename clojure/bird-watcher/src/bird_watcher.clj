(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4])

(def today last)

(defn inc-bird [birds]
  (conj (pop birds)  (+ 1 (today birds))))

(defn day-without-birds? [birds]
  (not (every? pos? birds)))

(defn n-days-count [birds n]
  (reduce + (take n birds)))

(defn busy-days [birds]
  (count (filter #(>= % 5) birds)))

(defn odd-week? [birds]
  (let [odd-week (take (count birds) (cycle '(1 0)))]
    (= odd-week birds)))
