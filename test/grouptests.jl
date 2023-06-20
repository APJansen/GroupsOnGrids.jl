
function test_inverses(group::PointGroup)
    for i = 1:group.order
        if group.composition[i, group.inverses[i]] != 1
            return false
        end
        if group.composition[group.inverses[i], i] != 1
            return false
        end
    end
    true
end

function test_subgroup_closure(group::PointGroup, subgroup_indices::Vector{Int})
    for i in subgroup_indices
        for j in subgroup_indices
            if group.composition[i, j] ∉ subgroup_indices
                return false
            end
        end
    end
    true
end
