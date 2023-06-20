"""
A point group is a group that leaves at least one element fixed.
Here, they are the part of the space groups that do not involve translations.
This leaves rotations and reflections.

# Fields
- `name::String`: The name.
- `order::Int`: The number of elements.
- `composition::Vector{Vector{Int}}`: The composition table.
- `inverses::Vector{Int}`: The inverses.
- `subgroups::Dict{String,Vector{Int}}`: The subgroups.
"""
struct PointGroup{I}
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end
const C1 = PointGroup{:C1}("C1", 1, [1], hcat(1), Dict("C1" => [1]))

const C2 = PointGroup{:C2}(
    "C2",
    2,
    [1, 2],
    [
        1 2
        2 1
    ],
    Dict("C1" => [1], "C2" => [1, 2]),
)

const D2 = PointGroup{:D2}(
    "D2",
    4,
    [1, 2, 3, 4],
    [
        1 2 3 4
        2 1 4 3
        3 4 1 2
        4 3 2 1
    ],
    Dict("C1" => [1], "C2" => [1, 2], "D2" => [1, 2, 3, 4]),
)

const C4 = PointGroup{:C4}(
    "C4",
    4,
    [1, 4, 3, 2],
    [
        1 2 3 4
        2 3 4 1
        3 4 1 2
        4 1 2 3
    ],
    Dict("C1" => [1], "C2" => [1, 3], "C4" => [1, 2, 3, 4]),
)

const D4 = PointGroup{:D4}(
    "D4",
    8,
    [1, 4, 3, 2, 5, 6, 7, 8],
    [
        1 2 3 4 5 6 7 8
        2 3 4 1 6 7 8 5
        3 4 1 2 7 8 5 6
        4 1 2 3 8 5 6 7
        5 8 7 6 1 4 3 2
        6 5 8 7 2 1 4 3
        7 6 5 8 3 2 1 4
        8 7 6 5 4 3 2 1
    ],
    Dict(
        "C1" => [1],
        "C2" => [1, 3],
        "D2" => [1, 5, 7, 3],
        "C4" => [1, 2, 3, 4],
        "D4" => [1, 2, 3, 4, 5, 6, 7, 8],
    ),
)

PointGroups = Dict("C1" => C1, "C2" => C2, "D2" => D2, "C4" => C4, "D4" => D4)
