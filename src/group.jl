
"""
Type for a group.
"""
struct Group
    name::String
    order::Int16
    composition::Vector{Vector{Int16}}
    inverses::Vector{Int16}
end
