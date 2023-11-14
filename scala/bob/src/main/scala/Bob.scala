object Bob {
  def response(statement: String): String =
    statement match {
      case _ if statement.trim.isEmpty => "Fine. Be that way!"
      case _ if isShouting(statement) && isQuestion(statement) => "Calm down, I know what I'm doing!"
      case _ if isShouting(statement) => "Whoa, chill out!"
      case _ if isQuestion(statement) => "Sure."
      case _ => "Whatever."
    }

  val isShouting: String => Boolean = (s) =>
    onlyLetters(s).forall(_.isUpper) && onlyLetters(s).length > 0
  val isQuestion: String => Boolean = _.trim.last == '?'
  val onlyLetters: String => String = _.filter(_.isLetter)
}
