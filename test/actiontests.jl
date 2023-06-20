function test_action_composition(space_group::SpaceGroup, x::AbstractArray, axes::AxesInfo)
    new_group_axis = 1
    point_group = space_group.point_group
    g_x = space_group(x, axes, new_group_axis)

    # This is when acting two times, first with the element at axis 1, then at axis 2
    # here we need to take care of the axes explicitly
    _, axes = lift(x, axes, new_group_axis)
    # Now the h axis is new_group_axis and the g axis is new_group_axis + 1
    h_on_g_x = space_group(g_x, axes, new_group_axis)

    # Now first compose the point group elements, then act once
    # flattened list of compositions
    h_compose_g = reshape(point_group.composition, :)
    indices = ntuple(a -> a == new_group_axis ? h_compose_g : :, ndims(g_x))
    h_g_on_x = g_x[indices...]
    # This has the actions of all 2 group element compositions on one axis,
    # so we need to spread them over two axes again
    h_g_on_x = reshape(h_g_on_x, size(h_on_g_x)...)

    # Check if the two are equal
    @test all(h_on_g_x .=== h_g_on_x)
end