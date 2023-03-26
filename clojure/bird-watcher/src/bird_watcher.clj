(ns bird-watcher)

(def last-week 
  (vector 0 2 5 3 7 8 4))

(defn today [birds]
  (last birds))

(defn inc-bird [birds]
  (conj (pop birds)  (+ 1 (today birds))))

(defn day-without-birds? [birds]
  (boolean (some #(= 0 %) birds)))

(defn n-days-count [birds n]
  (reduce + (take n birds)))

(defn busy-days [birds]
  (count (filterv #(>= % 5) birds)))

(defn odd-week? [birds]
  (cond
    (= (vector 1 0 1 0 1 0 1) birds) true
    (= (vector 0 1 0 1 0 1 0) birds) true
    :else false))
