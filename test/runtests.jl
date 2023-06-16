using GroupsOnGrids
using Test

@testset "GroupsOnGrids.jl" begin
    groups = GroupsOnGrids.WallpaperGroups
    @testset "Testing group inverses" begin
        for group in groups
            @testset "Testing inverses for group $(group.name)" begin
                for i = 1:group.order
                    @test group.composition[i][group.inverses[i]] == 1
                    @test group.composition[group.inverses[i]][i] == 1
                end
            end
        end
    end
end
