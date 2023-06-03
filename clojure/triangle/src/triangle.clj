(ns triangle)

(defn is-valid? [side-a side-b side-c]
  (and (> (+ side-a side-b) side-c)
       (> (+ side-a side-c) side-b)
       (> (+ side-b side-c) side-a)))

(defn equilateral? [side-a side-b side-c]
  (and (is-valid? side-a side-b side-c) (== side-a side-b side-c)))

(defn isosceles? [side-a side-b side-c]
  (and (is-valid? side-a side-b side-c)
       (<= (count (distinct [side-a side-b side-c])) 2)))
  

(defn scalene? [side-a side-b side-c]
  (and (is-valid? side-a side-b side-c)
       (not (equilateral? side-a side-b side-c))
       (not (isosceles? side-a side-b side-c))))
