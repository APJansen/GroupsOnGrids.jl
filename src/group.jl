
"""
Type for a group.
"""
struct Group
    name::String
    order::Int
    composition::Vector{Vector{Int}}
    inverses::Vector{Int}
    subgroups::Dict{String,Vector{Int}}
end

function Group(;
    name::String,
    order::Int,
    composition::Vector{Vector{Int}},
    inverses::Vector{Int},
    subgroups::Dict{String,Vector{Int}},
)
    Group(name, order, composition, inverses, subgroups)
end
