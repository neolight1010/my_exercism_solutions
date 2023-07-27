using System;

public static class Bob
{
    public static string Response(string statement)
    {
        statement = statement.Trim();

        if (statement.IsAQuestion() && statement.IsShouting())
        {
            return "Calm down, I know what I'm doing!";
        }

        if (statement.IsAQuestion())
        {
            return "Sure.";
        }

        if (statement.IsShouting())
        {
            return "Whoa, chill out!";
        }

        if (statement.IsSilence())
        {
            return "Fine. Be that way!";
        }

        return "Whatever.";
    }

    private static bool IsAQuestion(this string statement) => statement.EndsWith('?');

    private static bool IsShouting(this string statement)
    {
        var statementLetters = Array.FindAll(statement.ToCharArray(), Char.IsLetter);

        return Array.TrueForAll(statementLetters, Char.IsUpper) && statementLetters.Length > 0;
    }

    private static bool IsSilence(this string statement) =>
        Array.TrueForAll(statement.ToCharArray(), Char.IsWhiteSpace);
}
