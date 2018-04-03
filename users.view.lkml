view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  #Added first & last name as full name dimension
  dimension: name {
    type:  string
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  #For the purpose of static maps.
  dimension: region {  # Create a dimension called "region"
    case: {            # Define a set of cases and the corresponding labels for those cases

      # When the "state" dimension has a western state, label it "West"
      when: {
        sql: ${state} in ('WA','OR','CA','NV','UT','WY','ID','MT','CO','AK','HI') ;;
        label: "West"
      }

      # When the "state" dimension has a southwestern state, label it "Southwest"
      when: {
        sql: ${state} in ('AZ','NM','TX','OK') ;;
        label: "Southwest"
      }

      # When the "state" dimension has a midwestern state, label it "Midwest"
      when: {
        sql: ${state} in ('ND','SD','MN','IA','WI','MN','OH','IN','MO','NE','KS','MI','IL') ;;
        label: "Midwest"
      }

      # When the "state" dimension has a northeastern state, label it "Northeast"
      when: {
        sql: ${state} in ('MD','DE','NJ','CT','RI','MA','NH','PA','NY','VT','ME','DC') ;;
        label: "Northeast"
      }

      # When the "state" dimension has a southeastern state, label it "Southeast"
      when: {
        sql: ${state} in ('AR','LA','MS','AL','GA','FL','SC','NC','VA','TN','KY','WV') ;;
        label: "Southeast"
      }

      # If none of the above conditions are satisfied, label it "Unknown"
      else: "Unknown"
    }
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
