def get_column(j: int, matrix: list[list[int]]) -> list[int]:
    return [row[j] for row in matrix]


def saddle_points(matrix: list[list[int]]):
    # This problem can also be solved with max() and min() for finding
    # saddle points in rows and columns.
    if len(matrix) == 0: return []

    if not all([len(row) == len(matrix[0]) for row in matrix]):
        raise ValueError("Matrix cannot be irregular.")

    columns = [get_column(j, matrix) for j in range(len(matrix[0]))]

    saddles: list[dict[str, int]] = []

    # Check every element
    for i, row in enumerate(matrix):
        for j, x in enumerate(row):
            if all([x >= n for n in row]) and all([x <= n for n in columns[j]]):
                saddles.append({"row": i + 1, "column": j + 1})

    return saddles
