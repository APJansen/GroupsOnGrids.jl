using GroupsOnGrids
using Documenter

DocMeta.setdocmeta!(GroupsOnGrids, :DocTestSetup, :(using GroupsOnGrids); recursive = true)

makedocs(;
    modules = [GroupsOnGrids],
    authors = "Aron <aronpjansen@gmail.com> and contributors",
    repo = "https://github.com/APJansen/GroupsOnGrids.jl/blob/{commit}{path}#{line}",
    sitename = "GroupsOnGrids.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://APJansen.github.io/GroupsOnGrids.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = ["Home" => "index.md"],
)

deploydocs(; repo = "github.com/APJansen/GroupsOnGrids.jl", devbranch = "main")
