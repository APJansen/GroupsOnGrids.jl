struct C1 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function C1()
    C1("C1", 1, [1], hcat(1), Dict("C1" => [1]))
end


struct C2 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function C2()
    C2(
        "C2",
        2,
        [1, 2],
        [
            1 2
            2 1
        ],
        Dict("C1" => [1], "C2" => [1, 2]),
    )
end

struct D2 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function D2()
    D2(
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
end

struct C4 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function C4()
    C4(
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
end

struct D4 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function D4()
    D4(
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
end

PointGroups =
    Dict("C1" => C1(), "C2" => C2(), "D2" => D2(), "C4" => C4(), "D4" => D4())
