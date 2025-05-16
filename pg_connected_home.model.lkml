connection: "pg_connected_home"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: connected_home {
  join: day_count_by_home {
    type: left_outer
    relationship: many_to_one
    sql_on: ${connected_home.home_id} = ${day_count_by_home.home_id} ;;
  }
}
