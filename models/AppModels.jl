module AppModels

using Stipple
using StippleUI
using SQLite
using DataFrames

export AppModel

register_mixin(@__MODULE__)

const ALL = "All"
const db = SQLite.DB(joinpath("data", "instagram_dummy.db"))
const ids = DBInterface.execute(db, "select id from campaigns") |> DataFrame
const table_options = DataTableOptions(columns = Column(["id", "campaign", "influencer", "comment"]))

function get_data(column, table)
  result = DBInterface.execute(db, "select distinct(`$column`) from `$table`") |> DataFrame
  c = String[]
  for entry in result[!,Symbol(column)]
    for e in split(entry, ',')
      push!(c, strip(e))
    end
  end
  pushfirst!(c |> unique! |> sort!, ALL)
end

function get_comments(filters::Vector{<:String} = String[])
  query = "select * from comments where 1"
  for f in filters
    isempty(f) && continue
    query *= " and $f"
  end
  @debug query
  DBInterface.execute(db, query) |> DataFrame
end

function validvalue(filters::Vector{<:String})
  [endswith(f, "'%$(ALL)%'") || endswith(f, "'%%'") ? "" : f for f in filters]
end

@reactive mutable struct AppModel <: ReactiveModel
  message::R{String} = "Hello Stellar"
  filter_campaigns::R{String} = ALL
  filter_influencers::R{String} = ALL
  campaigns::Vector{<:String} = get_data("campaign", "campaigns")
  influencers::Vector{<:String} = get_data("influencer", "campaigns")
  commentstable::R{DataTable} = DataTable(get_comments(), table_options)
end

function handlers(model::AppModel) :: AppModel

  println("Run handler")
  onany(model.filter_campaigns, model.filter_influencers) do fc, fi
    model.isprocessing = true
    model.commentstable[] = DataTable(String[
      "`campaign` like '%$(fc)%'",
      "`influencer` like '%$(fi)%'",
    ] |> validvalue |> get_comments, table_options)
    model.isprocessing[] = false
  end
  println(model.commentstable)

  model
end

end
