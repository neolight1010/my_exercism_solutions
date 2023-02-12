(ns sublist)

(defn sublist? [list1 list2]
  (if (empty? list1)
    true

    (if (empty? list2)
      false

      (let [firstElementEqual (= (first list1) (first list2))]
        (if firstElementEqual
          (recur (rest list1) (rest list2))
          (recur list1 (rest list2))
        )
      )
    )
  )

)

(sublist? '(1 3) '(1 2 3))

(defn classify [list1 list2]
  (if (= list1 list2)
    :equal
    (if (sublist? list1 list2)
      :sublist
      (if (sublist? list2 list1)
        :superlist
        :unequal
      )
    )
  )
)
