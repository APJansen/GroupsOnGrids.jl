struct P1 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function P1()
    P1("P1", 1, [1], hcat(1), Dict("P1" => [1]))
end


struct P2 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function P2()
    P2(
        "P2",
        2,
        [1, 2],
        [
            1 2
            2 1
        ],
        Dict("P1" => [1], "P2" => [1, 2]),
    )
end

struct P2MM <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function P2MM()
    P2MM(
        "P2MM",
        4,
        [1, 2, 3, 4],
        [
            1 2 3 4
            2 1 4 3
            3 4 1 2
            4 3 2 1
        ],
        Dict("P1" => [1], "P2" => [1, 2], "P2MM" => [1, 2, 3, 4]),
    )
end

struct P4 <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function P4()
    P4(
        "P4",
        4,
        [1, 4, 3, 2],
        [
            1 2 3 4
            2 3 4 1
            3 4 1 2
            4 1 2 3
        ],
        Dict("P1" => [1], "P2" => [1, 3], "P4" => [1, 2, 3, 4]),
    )
end

struct P4M <: Group
    name::String
    order::Int
    inverses::Vector{Int}
    composition::Matrix{Int}
    subgroups::Dict{String,Vector{Int}}
end

function P4M()
    P4M(
        "P4M",
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
            "P1" => [1],
            "P2" => [1, 3],
            "P2MM" => [1, 5, 7, 3],
            "P4" => [1, 2, 3, 4],
            "P4M" => [1, 2, 3, 4, 5, 6, 7, 8],
        ),
    )
end

WallpaperGroups =
    Dict("P1" => P1(), "P2" => P2(), "P2MM" => P2MM(), "P4" => P4(), "P4M" => P4M())
