using GroupsOnGrids
using Test

include("grouptests.jl")
include("axestests.jl")
include("actiontests.jl")

@testset "GroupsOnGrids.jl" begin
    groups = GroupsOnGrids.PointGroups

    @testset "Testing point groups..." begin
        @testset "Testing inverses" begin
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
    end

    @testset "Testing axes manipulations" begin
        test_lift()
    end

    @testset "Testing whether action respects composition..." begin
        x = rand(1, 5, 5, 2)
        axes = AxesInfo(2, 3, nothing, nothing)
        for space_group in GroupsOnGrids.SpaceGroups
            @testset "... for group $(space_group)" begin
                test_action_composition(space_group, x, axes)
            end
        end
    end

end
