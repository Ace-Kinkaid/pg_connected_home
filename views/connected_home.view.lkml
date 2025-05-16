view: connected_home {
  sql_table_name: `looker-core-4cjg.pg_demo_data.connected_home` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: asset_id {
    type: number
    sql: ${TABLE}.asset_id ;;
  }
  dimension: asset_name {
    type: string
    sql: ${TABLE}.asset_name ;;
  }
  dimension: asset_timezone {
    type: string
    sql: ${TABLE}.asset_timezone ;;
  }
  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }
  dimension: avg_flow_rate_lpm {
    type: number
    sql: ${TABLE}.avg_flow_rate_lpm ;;
  }
  dimension: catchup_message {
    type: yesno
    sql: ${TABLE}.catchup_message ;;
  }
  dimension: device_label {
    type: string
    sql: ${TABLE}.device_label ;;
  }
  dimension: device_location {
    type: string
    sql: ${TABLE}.device_location ;;
  }
  dimension: duration_minutes {
    type: number
    sql: ${TABLE}.duration_minutes ;;
  }
  dimension: flow_time_minutes {
    type: number
    sql: ${TABLE}.flow_time_minutes ;;
  }
  dimension: home_id {
    type: string
    sql: ${TABLE}.home_id ;;
  }
  dimension: hot_volume_liters {
    type: number
    sql: ${TABLE}.hot_volume_liters ;;
  }
  dimension: is_hot {
    type: yesno
    sql: ${TABLE}.is_hot ;;
  }
  dimension_group: local {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.local_date ;;
  }
  dimension: local_end_time {
    type: string
    sql: ${TABLE}.local_end_time ;;
  }
  dimension: local_start_time {
    type: string
    sql: ${TABLE}.local_start_time ;;
  }
  dimension: local_week_day {
    type: string
    sql: ${TABLE}.local_week_day ;;
  }
  dimension: mac_address {
    type: string
    sql: ${TABLE}.mac_address ;;
  }
  dimension: max_flow_rate_lpm {
    type: number
    sql: ${TABLE}.max_flow_rate_lpm ;;
  }
  dimension: max_water_temp_celsius {
    type: number
    sql: ${TABLE}.max_water_temp_celsius ;;
  }
  dimension: min_water_temp_celsius {
    type: number
    sql: ${TABLE}.min_water_temp_celsius ;;
  }
  dimension: study_name {
    type: string
    sql: ${TABLE}.study_name ;;
  }
  dimension: total_volume_liters {
    type: number
    sql: ${TABLE}.total_volume_liters ;;
  }
  measure: total_vol_measure {
    type: sum
    sql: ${total_volume_liters} ;;
  }
  measure: hot_count {
    type: sum
    sql: case when ${is_hot} = TRUE then 1 else 0 end ;;
  }
  measure: cold_count {
    type: sum
    sql: case when ${is_hot} = FALSE then 1 else 0 end ;;
  }
  measure: count_of_days {
    type: count_distinct
    sql: ${local_date} ;;
  }
  measure: avg_event_count {
    type: number
    sql: ${count} / ${day_count_by_home.total_count_of_days_by_home} ;;
    value_format_name: decimal_2
  }

  # dimension: avg_event_count_dim {
  #   type: number
  #   sql: ${avg_event_count} ;;
  # }

  # measure: avg_event_count_hot {
  #   label: "Avg Daily Hot Count"
  #   type: number
  #   sql: ${count} / ${day_count_by_home.total_count_of_days_by_home} ;;
  #   value_format_name: decimal_2
  # }

  # measure: avg_event_count_cold {
  #   label: "Avg Daily Cold Count"
  #   type: number
  #   sql: ${count} / ${day_count_by_home.total_count_of_days_by_home} ;;
  #   value_format_name: decimal_2
  # }


  # measure: avg_event_count_hot {
  #   label: "Avg Daily Hot Count"
  #   type: sum
  #   sql: ${avg_event_count_dim} ;;
  #   filters: [is_hot: "Yes"]
  # }

  # measure: avg_event_count_cold {
  #   label: "Avg Daily Cold Count"
  #   type: sum
  #   sql: ${avg_event_count_dim} ;;
  #   filters: [is_hot: "No"]
  # }

  measure: count {
    type: count
    drill_fields: [id, study_name, asset_name]
  }
}
