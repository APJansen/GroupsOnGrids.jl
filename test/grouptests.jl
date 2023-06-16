
function test_inverses(group::Group)
    for i = 1:group.order
        if group.composition[i][group.inverses[i]] != 1
            return false
        end
        if group.composition[group.inverses[i]][i] != 1
            return false
        end
    end
    true
end
