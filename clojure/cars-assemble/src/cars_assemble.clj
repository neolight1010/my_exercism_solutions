(ns cars-assemble)

(defn success-rate [speed]
  (condp <= speed
    10 0.77
    9 0.8
    8 0.9
    4 1.0
    0 0.0
    ))

(defn production-rate-no-faulty [speed]
  (* 221 speed))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* (success-rate speed) (production-rate-no-faulty speed)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (quot (production-rate speed) 60)))
