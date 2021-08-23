def slices(series: str, length: int) -> list[str]:
    if length > len(series) or length < 1:
        raise ValueError("Length value invalid.")

    result: list[str] = []
    for i in range(0, len(series) - length + 1):
        result.append(series[i:i+length])

    return result
