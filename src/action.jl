
"""
Represents the action of all elements of a group.

# Fields
- `group`: The group that is acting.
- `new_group_axis`: The position of the new group axis.
"""
abstract type GroupAction end

"""
Apply a group action to a grid.

# Arguments
- `ga`: The group action to apply.
- `x`: The grid to act on.
- `axes`: The meaning of the axes of the grid.

# Returns
The grid after the group action has been applied.
"""
function act_on_grid(ga::GroupAction, x::AbstractArray, axes::AxesInfo) end

function (ga::GroupAction)(x::AbstractArray, axes::AxesInfo)
    x, axes = lift(x, axes, ga.new_group_axis)
    x = act_on_grid(ga, x, axes)
    # TODO: acting on group
    x
end

#########
# P1
#########
struct P1_action <: GroupAction
    group::PointGroup
    new_group_axis::Int
end

function P1_action(new_group_axis::Int)
    P1_action(C1, new_group_axis)
end

function act_on_grid(ga::P1_action, x::AbstractArray, axes::AxesInfo)
    x
end

#########
# P2
#########
struct P2_action <: GroupAction
    group::PointGroup
    new_group_axis::Int
end

function P2_action(new_group_axis::Int)
    P2_action(C2, new_group_axis)
end

function act_on_grid(ga::P2_action, x::AbstractArray, axes::AxesInfo)
    x_rotated = reverse(x, dims = (axes.width, axes.height))
    x = cat(x, x_rotated, dims = ga.new_group_axis)
    x
end

#########
# P2MM
#########
struct P2MM_action <: GroupAction
    group::PointGroup
    new_group_axis::Int
end

function P2MM_action(new_group_axis::Int)
    P2MM_action(D2, new_group_axis)
end

function act_on_grid(ga::P2MM_action, x::AbstractArray, axes::AxesInfo)
    x = cat(x, reverse(x, dims = axes.height), dims = ga.new_group_axis)
    x = cat(x, reverse(x, dims = axes.width), dims = ga.new_group_axis)

    x
end

#########
# P4
#########
struct P4_action <: GroupAction
    group::PointGroup
    new_group_axis::Int
end

function P4_action(new_group_axis::Int)
    P4_action(C4, new_group_axis)
end

function act_on_grid(ga::P4_action, x::AbstractArray, axes::AxesInfo)
    x = cat(x, reverse(x, dims = (axes.width, axes.height)), dims = ga.new_group_axis)
    x = cat(
        x,
        reverse(swap_axes(x, axes.width, axes.height), dims = axes.height),
        dims = ga.new_group_axis,
    )

    # put the elements in the right order
    order = [1, 3, 2, 4]
    indices = ntuple(a -> a == ga.new_group_axis ? order : :, ndims(x))
    x = x[indices...]

    x
end

#########
# P4M
#########
struct P4M_action <: GroupAction
    group::PointGroup
    new_group_axis::Int
end

function P4M_action(new_group_axis::Int)
    P4M_action(D4, new_group_axis)
end

function act_on_grid(ga::P4M_action, x::AbstractArray, axes::AxesInfo)
    x = cat(x, reverse(x, dims = axes.width), dims = ga.new_group_axis)
    x = cat(x, reverse(x, dims = axes.height), dims = ga.new_group_axis)
    x = cat(x, swap_axes(x, axes.width, axes.height), dims = ga.new_group_axis)

    # put the elements in the right order
    order = [1, 6, 4, 7, 2, 5, 3, 8]
    indices = ntuple(a -> a == ga.new_group_axis ? order : :, ndims(x))
    x = x[indices...]

    x
end

WallpaperActions = [P1_action, P2_action, P2MM_action, P4_action, P4M_action]
