using GroupsOnGrids
using Documenter

DocMeta.setdocmeta!(GroupsOnGrids, :DocTestSetup, :(using GroupsOnGrids); recursive = true)

makedocs(;
    modules = [GroupsOnGrids],
    authors = "Aron <aronpjansen@gmail.com> and contributors",
    repo = "https://github.com/apjansen/GroupsOnGrids.jl/blob/{commit}{path}#{line}",
    sitename = "GroupsOnGrids.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://apjansen.github.io/GroupsOnGrids.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = ["Home" => "index.md"],
)

deploydocs(; repo = "github.com/apjansen/GroupsOnGrids.jl", devbranch = "main")
