- dashboard: test
  title: test
  layout: newspaper
  elements:
  - title: test look
    name: test look
    model: jay_project
    explore: user_data
    type: table
    fields:
    - user_data.id
    - users.age
    - users.city
    - users.country
    limit: 250
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to White to Green
        colors:
        - "#F36254"
        - "#FFFFFF"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - users.age
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '100'
    row: 0
    col: 0
    width: 8
    height: 6
  - name: test look1
    title: test look1
    model: jay_project
    explore: orders
    type: table
    fields:
    - users.age
    - users.city
    - users.state
    - users.count
    sorts:
    - users.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      jay_test_filter: users.age
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: jay_test_filter
    title: jay_test_filter
    type: field_filter
    default_value: ">18"
    model: jay_project
    explore: orders
    field: users.age
    listens_to_filters: []
    allow_multiple_values: true
    required: false
