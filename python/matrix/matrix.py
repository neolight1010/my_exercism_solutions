class Matrix:
    def __init__(self, matrix_string: str):
        row_strs = matrix_string.splitlines()

        self.matrix = [[int(x) for x in row_str.split()] for row_str in row_strs]

    def row(self, index: int) -> list[int]:
        """
        Return a row (1-base index).
        """
        return self.matrix[index - 1].copy()

    def column(self, index: int) -> list[int]:
        """
        Return a column (1-base index).
        """
        return [row[index - 1] for row in self.matrix]
