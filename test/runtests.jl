using GroupsOnGrids
using Test

include("grouptests.jl")
include("axestests.jl")


@testset "GroupsOnGrids.jl" begin
    groups = GroupsOnGrids.WallpaperGroups

    @testset "Testing group inverses" begin
        for group in values(groups)
            @testset "Testing inverses for group $(group.name)" begin
                @test test_inverses(group)
            end
        end
    end

    @testset "Testing subgroup closure" begin
        for group in values(groups)
            @testset "Closure of group $(group.name)'s subgroups..." begin
                for (subgroup_name, subgroup_indices) in group.subgroups
                    subgroup = groups[subgroup_name]
                    @testset "... subgroup $(subgroup.name)" begin
                        @test test_subgroup_closure(group, subgroup_indices)
                    end
                end
            end
        end
    end

    @testset "Testing axes manipulations" begin
        test_lift()
    end

end
