"""
Abstract type for a group.

# Fields
- `name::String`: The name of the group.
- `order::Int`: The order of the group.
- `composition::Vector{Vector{Int}}`: The composition table of the group.
- `inverses::Vector{Int}`: The inverse table of the group.
- `subgroups::Dict{String,Vector{Int}}`: The subgroups of the group.
"""
abstract type Group end
