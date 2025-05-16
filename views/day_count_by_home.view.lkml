view: day_count_by_home {
  derived_table: {
    sql:
    SELECT
      connected_home.home_id  AS day_home_id,
      COUNT(DISTINCT ( connected_home.local_date  ) ) AS count_of_days_by_home
    FROM `[your_project].[your_dataset].[your_table]`  AS connected_home
    WHERE {% condition connected_home.local_date %} connected_home.local_date {% endcondition %}
    GROUP BY
      1 ;;
    }
  dimension: home_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.day_home_id ;;
  }
  dimension: count_of_days_by_home {
    description: ""
    type: number
    sql: ${TABLE}.count_of_days_by_home ;;
  }
  measure: total_count_of_days_by_home {
    type: sum
    sql: ${count_of_days_by_home} ;;
  }
}
