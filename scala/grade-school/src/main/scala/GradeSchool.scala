import scala.collection.SortedMap

class School {
  type DB = SortedMap[Int, Seq[String]]
  private var _db: DB = SortedMap()

  def add(name: String, g: Int) = {
    _db = _db + (g -> (grade(g) :+ name))
  }

  def db: DB = _db

  def grade(g: Int): Seq[String] = _db.getOrElse(g, Seq())

  def sorted =
    _db.mapValues(_.sorted).toMap
}

