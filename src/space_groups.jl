"""
The space groups.

Each space group is defined by a point group and a way of using it to act on a grid.
"""
struct SpaceGroup{I}
    point_group::PointGroup
end

const P1 = SpaceGroup{:P1}(C1)
const P2 = SpaceGroup{:P2}(C2)
const P2MM = SpaceGroup{:P2MM}(D2)
const P4 = SpaceGroup{:P4}(C4)
const P4M = SpaceGroup{:P4M}(D4)

SpaceGroups = [P1, P2, P2MM, P4, P4M]


function (g::SpaceGroup)(x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x, axes = lift(x, axes, new_group_axis)
    x = act_on_grid(g, x, axes, new_group_axis)
    # TODO: acting on group
    x
end

"""
Apply a space group to a grid.

# Arguments
- `g`: The group to apply.
- `x`: The grid to act on.
- `axes`: The meaning of the axes of the grid.
- `new_group_axis`: The axis on which group actions should be concatenated.

# Returns
The grid after the group action has been applied.
"""
function act_on_grid(g::SpaceGroup, x::AbstractArray, axes::AxesInfo, new_group_axis::Int) end

function act_on_grid(g::SpaceGroup{:P1}, x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x
end

function act_on_grid(g::SpaceGroup{:P2}, x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x_rotated = reverse(x, dims = (axes.width, axes.height))
    x = cat(x, x_rotated, dims = new_group_axis)
    x
end

function act_on_grid(g::SpaceGroup{:P2MM}, x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x = cat(x, reverse(x, dims = axes.height), dims = new_group_axis)
    x = cat(x, reverse(x, dims = axes.width), dims = new_group_axis)
    x
end

function act_on_grid(g::SpaceGroup{:P4}, x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x = cat(x, reverse(x, dims = (axes.width, axes.height)), dims = new_group_axis)
    x = cat(
        x,
        reverse(swap_axes(x, axes.width, axes.height), dims = axes.height),
        dims = new_group_axis,
    )
    # put the elements in the right order
    order = [1, 3, 2, 4]
    indices = ntuple(a -> a == new_group_axis ? order : :, ndims(x))
    x = x[indices...]
    x
end

function act_on_grid(g::SpaceGroup{:P4M}, x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x = cat(x, reverse(x, dims = axes.width), dims = new_group_axis)
    x = cat(x, reverse(x, dims = axes.height), dims = new_group_axis)
    x = cat(x, swap_axes(x, axes.width, axes.height), dims = new_group_axis)
    # put the elements in the right order
    order = [1, 6, 4, 7, 2, 5, 3, 8]
    indices = ntuple(a -> a == new_group_axis ? order : :, ndims(x))
    x = x[indices...]
    x
end
