function test_lift()
    x = rand(3, 4, 5)
    axes = AxesInfo(1, 2, 3, nothing)
    x_lifted, axes_lifted = lift(x, axes, 2)
    @test axes_lifted == AxesInfo(1, 3, 4, nothing)
    @test size(x_lifted) == (3, 1, 4, 5)

    x_lifted, axes_lifted = lift(x, axes, 1)
    @test axes_lifted == AxesInfo(2, 3, 4, nothing)
    @test size(x_lifted) == (1, 3, 4, 5)
end