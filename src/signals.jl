"""
Represents the meaning of the axes of a signal.

# Fields
- `width`: The axis of the signal representing the width.
- `height`: The axis of the signal representing the height.
- `depth`: The axis of the signal representing the depth.
- `group`: The axis of the signal representing the group element.
"""
struct AxesInfo
    width::Union{Nothing,Int}
    height::Union{Nothing,Int}
    depth::Union{Nothing,Int}
    group::Union{Nothing,Int}
end

"""
In case the group axis comes before the width or height axis, we need to adjust the axes.
"""
function adjust_axes(axes::AxesInfo, new_group_axis::Int)
    axes_list = [getfield(axes, f) for f in fieldnames(AxesInfo)]
    for (i, axis) in enumerate(axes_list)
        if axis !== nothing && axis >= new_group_axis
            axes_list[i] += 1
        end
    end
    return AxesInfo(axes_list...)
end

"""
Add a dimension to the signal representing the group element acted by.

The new group axis will bbe at the position `new_group_axis`, while the other axes
maintain their relative order and are shifted accordingly.
"""
function lift(x::AbstractArray, axes::AxesInfo, new_group_axis::Int)
    x = reshape(x, (size(x)..., 1))

    # Calculate the new order of dimensions
    dims = 1:ndims(x)
    order = vcat(dims[1:new_group_axis-1], ndims(x), dims[new_group_axis:end-1])
    x = permutedims(x, order)

    axes = adjust_axes(axes, new_group_axis)

    return x, axes
end

"""
Swap two given axes, keeping the other axes in their relative order.
"""
function swap_axes(x::AbstractArray, axis1, axis2)
    axes = collect(1:ndims(x))
    axes[axis1], axes[axis2] = axes[axis2], axes[axis1]
    x = permutedims(x, axes)
    x
end