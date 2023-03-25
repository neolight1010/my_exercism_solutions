(ns sublist)

(defn sublist? [coll1 coll2]
  (some #{coll1} (partition (count coll1) 1 coll2)
  )
)

(sublist? '(1 2) '(1 2 3))

(defn classify [list1 list2]
  (cond (= list1 list2) :equal
        (sublist? list1 list2) :sublist
        (sublist? list2 list1) :superlist
        :else :unequal
  )
)
