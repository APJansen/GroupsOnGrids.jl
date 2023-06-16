using GroupsOnGrids
using Test

include("grouptests.jl")


@testset "GroupsOnGrids.jl" begin
    groups = GroupsOnGrids.WallpaperGroups

    @testset "Testing group inverses" begin
        for group in values(groups)
            @testset "Testing inverses for group $(group.name)" begin
                @test test_inverses(group)
            end
        end
    end

end
