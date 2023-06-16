
P1 = Group(name = "P1", order = 1, inverses = [1], composition = [[1]])

P2 = Group(name = "P2", order = 2, inverses = [1, 2], composition = [[1, 2], [2, 1]])

P2MM = Group(
    name = "P2MM",
    order = 4,
    inverses = [1, 2, 3, 4],
    composition = [[1, 2, 3, 4], [2, 1, 4, 3], [3, 4, 1, 2], [4, 3, 2, 1]],
)

P4 = Group(
    name = "P4",
    order = 4,
    inverses = [1, 4, 3, 2],
    composition = [[1, 2, 3, 4], [2, 3, 4, 1], [3, 4, 1, 2], [4, 1, 2, 3]],
)

P4M = Group(
    name = "P4M",
    order = 8,
    inverses = [1, 4, 3, 2, 5, 6, 7, 8],
    composition = [
        [1, 2, 3, 4, 5, 6, 7, 8],
        [2, 3, 4, 1, 6, 7, 8, 5],
        [3, 4, 1, 2, 7, 8, 5, 6],
        [4, 1, 2, 3, 8, 5, 6, 7],
        [5, 8, 7, 6, 1, 4, 3, 2],
        [6, 5, 8, 7, 2, 1, 4, 3],
        [7, 6, 5, 8, 3, 2, 1, 4],
        [8, 7, 6, 5, 4, 2, 2, 1],
    ],
)

WallpaperGroups = Dict("P1" => P1, "P2" => P2, "P2MM" => P2MM, "P4" => P4, "P4M" => P4M)
