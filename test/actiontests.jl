function test_action_composition(action::GroupAction, x::AbstractArray, axes::AxesInfo)
    group = action.group
    g_x = action(x, axes)

    # This is when acting two times, first with the element at axis 1, then at axis 2
    h_on_g_x = action(g_x, axes)

    # Now first compose the group elements, then act once
    # flattened list of compositions
    h_compose_g = reshape(group.composition, :)
    indices = ntuple(a -> a == ndims(g_x) ? h_compose_g : :, ndims(g_x))
    h_g_on_x = g_x[indices...]
    h_g_on_x = reshape(h_g_on_x, size(g_x)..., group.order)

    # Check if the two are equal
    print(h_on_g_x .=== h_g_on_x)
    @test all(h_on_g_x .=== h_g_on_x)
end