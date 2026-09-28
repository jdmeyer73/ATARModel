library(shiny)

ui <- fluidPage(
   
   tags$head(
      tags$style(HTML("
      body {
        background-color: #f5f5f5;
        font-family: Arial, sans-serif;
      }

      .model-container {
        max-width: 1050px;
        margin: 25px auto;
        background: white;
        padding: 30px 40px;
        border: 1px solid #cccccc;
      }

      .model-title {
        font-size: 26px;
        font-weight: bold;
        color: #5b3322;
        margin-bottom: 25px;
      }

      .equation-row {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 8px;
        margin-bottom: 8px;
        font-size: 22px;
        color: #5b3322;
      }

      .equation-row .form-group {
        margin-bottom: 0;
      }

      .number-input {
        width: 85px;
      }

      .percent-input {
        width: 75px;
      }

      input.form-control {
        font-size: 18px;
        font-weight: bold;
        height: 38px;
        text-align: center;
      }

      .times {
        font-style: italic;
        font-size: 25px;
        width: 20px;
      }

      .output-row {
        margin-top: 15px;
        font-size: 23px;
        color: #5b3322;
      }

      .output-value {
        display: inline-block;
        min-width: 100px;
        padding: 5px 10px;
        border-bottom: 2px solid #999999;
        font-weight: bold;
        color: #222222;
        text-align: center;
      }

      .profit-section {
        margin-top: 35px;
        padding-top: 20px;
        border-top: 1px solid #dddddd;
      }

      .controls-section {
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #dddddd;
      }

      .calculate-button {
        background-color: #f57c00;
        color: black;
        font-weight: bold;
        border: 1px solid #555;
        margin-right: 15px;
      }

      .calculate-button:hover {
        background-color: #e66f00;
        color: white;
      }

      .clear-button {
        margin-right: 15px;
      }

      .result-highlight {
        font-size: 28px;
        font-weight: bold;
      }

      .status-current {
        color: #2e7d32;
        font-weight: bold;
      }

      .status-stale {
        color: #b35c00;
        font-weight: bold;
      }

      .status-start {
        color: #666666;
      }

      .flow-header {
        text-align: center;
        margin-bottom: 10px;
      }

      .flow-title {
        font-size: 28px;
        font-weight: bold;
        color: #5b3322;
      }

      .flow-subtitle {
        font-size: 16px;
        color: #666666;
        margin-top: 5px;
      }

      .flow-total {
        margin-top: 8px;
        font-size: 22px;
        font-weight: bold;
        color: #5b3322;
      }

      .flow-wrapper {
        width: 100%;
        overflow-x: auto;
        margin-top: 15px;
      }

      .flow-note {
        text-align: center;
        font-size: 14px;
        color: #777777;
        margin-top: 8px;
      }

      .tab-content {
        padding-top: 10px;
      }

      .nav-tabs > li > a {
        font-size: 18px;
        font-weight: bold;
      }
    "))
   ),
   
   div(
      class = "model-container",
      
      tabsetPanel(
         
         id = "main_tabs",
         
         tabPanel(
            "ATAR Calculator",
            
            div(
               class = "model-title",
               "Video Smart Home Device"
            ),
            
            div(
               class = "equation-row",
               span("Units sold ="),
               
               div(
                  class = "number-input",
                  numericInput(
                     "buying_units",
                     label = NULL,
                     value = 10,
                     min = 0,
                     step = 1
                  )
               ),
               
               span("million buying units")
            ),
            
            div(
               class = "equation-row",
               span(class = "times", "×"),
               
               div(
                  class = "percent-input",
                  numericInput(
                     "awareness",
                     label = NULL,
                     value = 40,
                     min = 0,
                     max = 100,
                     step = 1
                  )
               ),
               
               span("percent awareness")
            ),
            
            div(
               class = "equation-row",
               span(class = "times", "×"),
               
               div(
                  class = "percent-input",
                  numericInput(
                     "trial",
                     label = NULL,
                     value = 20,
                     min = 0,
                     max = 100,
                     step = 1
                  )
               ),
               
               span("percent trial")
            ),
            
            div(
               class = "equation-row",
               span(class = "times", "×"),
               
               div(
                  class = "percent-input",
                  numericInput(
                     "availability",
                     label = NULL,
                     value = 70,
                     min = 0,
                     max = 100,
                     step = 1
                  )
               ),
               
               span("percent availability")
            ),
            
            div(
               class = "equation-row",
               span(class = "times", "×"),
               span("1 + ("),
               
               div(
                  class = "percent-input",
                  numericInput(
                     "repeat_rate",
                     label = NULL,
                     value = 20,
                     min = 0,
                     max = 100,
                     step = 1
                  )
               ),
               
               span("percent who will repeat ×"),
               
               div(
                  class = "number-input",
                  numericInput(
                     "additional_units",
                     label = NULL,
                     value = 1,
                     min = 0,
                     step = 0.1
                  )
               ),
               
               span("additional units per year)")
            ),
            
            div(
               class = "output-row",
               span("= "),
               span(
                  class = "output-value",
                  textOutput("units_sold", inline = TRUE)
               ),
               span(" million units")
            ),
            
            div(
               class = "profit-section",
               
               div(
                  class = "equation-row",
                  span("Profit per unit = $"),
                  
                  div(
                     class = "number-input",
                     numericInput(
                        "revenue",
                        label = NULL,
                        value = 100,
                        min = 0,
                        step = 1
                     )
                  ),
                  
                  span("Revenue per unit − $"),
                  
                  div(
                     class = "number-input",
                     numericInput(
                        "cost",
                        label = NULL,
                        value = 50,
                        min = 0,
                        step = 1
                     )
                  ),
                  
                  span("Costs per unit")
               ),
               
               div(
                  class = "output-row",
                  span("Profit per unit = $"),
                  span(
                     class = "output-value",
                     textOutput("profit_per_unit", inline = TRUE)
                  )
               ),
               
               div(
                  class = "output-row result-highlight",
                  span("Profits ="),
                  span(
                     class = "output-value",
                     textOutput("profit", inline = TRUE)
                  ),
                  span(" million")
               )
            ),
            
            div(
               class = "controls-section",
               
               actionButton(
                  "calculate",
                  "Calculate",
                  class = "calculate-button"
               ),
               
               actionButton(
                  "clear",
                  "Clear",
                  class = "clear-button"
               ),
               
               div(
                  style = "margin-top: 12px; font-size: 16px;",
                  uiOutput("status_message")
               )
            )
         ),
         
         tabPanel(
            "Market Flow",
            
            div(
               class = "flow-header",
               
               div(
                  class = "flow-title",
                  "Forecast Market Flow"
               ),
               
               div(
                  class = "flow-subtitle",
                  "Based on the most recent calculation"
               ),
               
               div(
                  class = "flow-total",
                  uiOutput("flow_total")
               )
            ),
            
            div(
               class = "flow-wrapper",
               uiOutput("market_flow")
            ),
            
            div(
               class = "flow-note",
               "Flow widths represent the relative size of each group."
            )
         )
      )
   )
)

server <- function(input, output, session) {
   
   results <- reactiveVal(NULL)
   inputs_changed <- reactiveVal(FALSE)
   
   
   format_m <- function(x) {
      paste0(
         format(
            round(x, 2),
            nsmall = 2,
            trim = TRUE
         ),
         "M"
      )
   }
   
   
   observeEvent(input$calculate, {
      
      buying_units <- input$buying_units
      
      aware_units <-
         buying_units *
         (input$awareness / 100)
      
      trial_units <-
         aware_units *
         (input$trial / 100)
      
      initial_units <-
         trial_units *
         (input$availability / 100)
      
      repeat_units <-
         initial_units *
         (input$repeat_rate / 100) *
         input$additional_units
      
      total_units <-
         initial_units + repeat_units
      
      profit_unit <-
         input$revenue - input$cost
      
      total_profit <-
         total_units * profit_unit
      
      results(
         list(
            buying_units = buying_units,
            aware_units = aware_units,
            trial_units = trial_units,
            initial_units = initial_units,
            repeat_units = repeat_units,
            total_units = total_units,
            profit_unit = profit_unit,
            total_profit = total_profit,
            
            not_aware = buying_units - aware_units,
            no_trial = aware_units - trial_units,
            no_availability = trial_units - initial_units
         )
      )
      
      inputs_changed(FALSE)
      
      updateActionButton(
         session,
         "calculate",
         label = "Recalculate"
      )
   })
   
   
   observeEvent(
      list(
         input$buying_units,
         input$awareness,
         input$trial,
         input$availability,
         input$repeat_rate,
         input$additional_units,
         input$revenue,
         input$cost
      ),
      {
         
         if (!is.null(results())) {
            inputs_changed(TRUE)
         }
         
      },
      ignoreInit = TRUE
   )
   
   
   output$status_message <- renderUI({
      
      if (is.null(results())) {
         
         span(
            class = "status-start",
            "Enter assumptions and click Calculate."
         )
         
      } else if (inputs_changed()) {
         
         span(
            class = "status-stale",
            "Inputs changed — click Recalculate to update the forecast."
         )
         
      } else {
         
         span(
            class = "status-current",
            "Forecast is current."
         )
      }
   })
   
   
   output$units_sold <- renderText({
      
      req(results())
      
      format(
         round(results()$total_units, 3),
         nsmall = 2,
         trim = TRUE
      )
   })
   
   
   output$profit_per_unit <- renderText({
      
      req(results())
      
      format(
         round(results()$profit_unit, 2),
         nsmall = 2
      )
   })
   
   
   output$profit <- renderText({
      
      req(results())
      
      paste0(
         "$",
         format(
            round(results()$total_profit, 2),
            nsmall = 2,
            big.mark = ","
         )
      )
   })
   
   
   output$flow_total <- renderUI({
      
      if (is.null(results())) {
         
         span(
            style = "color:#777777; font-weight:normal;",
            "Run the ATAR calculation to display the market flow."
         )
         
      } else {
         
         span(
            paste0(
               "Total Units Sold: ",
               format_m(results()$total_units)
            )
         )
      }
   })
   
   
   output$market_flow <- renderUI({
      
      req(results())
      
      r <- results()
      
      # Width of each flow is proportional to the original buying-unit market.
      # A minimum width keeps small flows visible.
      flow_width <- function(value) {
         
         if (r$buying_units <= 0) {
            return(4)
         }
         
         max(
            5,
            70 * value / r$buying_units
         )
      }
      
      w_aware <- flow_width(r$aware_units)
      w_not_aware <- flow_width(r$not_aware)
      
      w_trial <- flow_width(r$trial_units)
      w_no_trial <- flow_width(r$no_trial)
      
      w_initial <- flow_width(r$initial_units)
      w_no_avail <- flow_width(r$no_availability)
      
      w_repeat <- flow_width(r$repeat_units)
      
      svg <- paste0(
         
         '
      <svg
        viewBox="0 0 1000 520"
        width="100%"
        style="min-width:850px; max-width:1000px; display:block; margin:auto;"
        role="img"
        aria-label="ATAR market flow diagram"
      >

        <defs>

          <filter id="shadow" x="-20%" y="-20%" width="140%" height="140%">
            <feDropShadow
              dx="0"
              dy="2"
              stdDeviation="2"
              flood-color="#999999"
              flood-opacity="0.25"
            />
          </filter>

        </defs>


        <!-- MAIN FLOWS -->

        <path
          d="M 170 155 C 205 155, 215 155, 250 155"
          fill="none"
          stroke="#7FB3E1"
          stroke-width="', w_aware, '"
          stroke-linecap="round"
          opacity="0.68"
        >
          <title>Aware: ', format_m(r$aware_units), '</title>
        </path>


        <path
          d="M 370 155 C 405 155, 415 155, 450 155"
          fill="none"
          stroke="#8BCB88"
          stroke-width="', w_trial, '"
          stroke-linecap="round"
          opacity="0.70"
        >
          <title>Want Trial: ', format_m(r$trial_units), '</title>
        </path>


        <path
          d="M 570 155 C 605 155, 615 155, 650 155"
          fill="none"
          stroke="#F1C75B"
          stroke-width="', w_initial, '"
          stroke-linecap="round"
          opacity="0.75"
        >
          <title>Initial Buyers: ', format_m(r$initial_units), '</title>
        </path>


        <path
          d="M 770 155 C 805 155, 825 180, 875 200"
          fill="none"
          stroke="#A982C4"
          stroke-width="', w_initial, '"
          stroke-linecap="round"
          opacity="0.65"
        >
          <title>Initial Units: ', format_m(r$initial_units), '</title>
        </path>


        <!-- DROP-OFF FLOWS -->

        <path
          d="M 110 205 C 110 280, 170 310, 220 335"
          fill="none"
          stroke="#E68A8A"
          stroke-width="', w_not_aware, '"
          stroke-linecap="round"
          opacity="0.50"
        >
          <title>Not Aware: ', format_m(r$not_aware), '</title>
        </path>


        <path
          d="M 310 205 C 310 280, 370 310, 420 335"
          fill="none"
          stroke="#E68A8A"
          stroke-width="', w_no_trial, '"
          stroke-linecap="round"
          opacity="0.50"
        >
          <title>No Trial: ', format_m(r$no_trial), '</title>
        </path>


        <path
          d="M 510 205 C 510 280, 570 310, 620 335"
          fill="none"
          stroke="#E68A8A"
          stroke-width="', w_no_avail, '"
          stroke-linecap="round"
          opacity="0.50"
        >
          <title>No Availability: ', format_m(r$no_availability), '</title>
        </path>


<!-- REPEAT FLOW: INITIAL BUYERS TO REPEAT -->

<path
  d="M 710 105
     C 715 75, 735 67, 765 67"
  fill="none"
  stroke="#9A69BE"
  stroke-width="', w_repeat, '"
  stroke-linecap="round"
  opacity="0.85"
>
  <title>Repeat Units: ', format_m(r$repeat_units), '</title>
</path>


<!-- REPEAT FLOW: REPEAT TO TOTAL -->

<path
  d="M 910 67
     C 960 75, 965 115, 932 150"
  fill="none"
  stroke="#9A69BE"
  stroke-width="', w_repeat, '"
  stroke-linecap="round"
  opacity="0.85"
>
  <title>Repeat Units added to total: ', format_m(r$repeat_units), '</title>
</path>


        <!-- BUYING UNITS -->

        <rect
          x="50"
          y="105"
          width="120"
          height="100"
          rx="10"
          fill="#F28E3B"
          filter="url(#shadow)"
        />

        <text
          x="110"
          y="140"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#3F291D"
        >
          Buying Units
        </text>

        <text
          x="110"
          y="170"
          text-anchor="middle"
          font-size="20"
          font-weight="bold"
          fill="#3F291D"
        >
          ', format_m(r$buying_units), '
        </text>


        <!-- AWARE -->

        <rect
          x="250"
          y="105"
          width="120"
          height="100"
          rx="10"
          fill="#9EC5E8"
          filter="url(#shadow)"
        />

        <text
          x="310"
          y="140"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#243746"
        >
          Aware
        </text>

        <text
          x="310"
          y="170"
          text-anchor="middle"
          font-size="20"
          font-weight="bold"
          fill="#243746"
        >
          ', format_m(r$aware_units), '
        </text>


        <!-- WANT TRIAL -->

        <rect
          x="450"
          y="105"
          width="120"
          height="100"
          rx="10"
          fill="#A9D7A5"
          filter="url(#shadow)"
        />

        <text
          x="510"
          y="140"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#29452A"
        >
          Want Trial
        </text>

        <text
          x="510"
          y="170"
          text-anchor="middle"
          font-size="20"
          font-weight="bold"
          fill="#29452A"
        >
          ', format_m(r$trial_units), '
        </text>


        <!-- INITIAL BUYERS -->

        <rect
          x="650"
          y="105"
          width="120"
          height="100"
          rx="10"
          fill="#F4D77C"
          filter="url(#shadow)"
        />

        <text
          x="710"
          y="137"
          text-anchor="middle"
          font-size="17"
          font-weight="bold"
          fill="#493A15"
        >
          Initial Buyers
        </text>

        <text
          x="710"
          y="170"
          text-anchor="middle"
          font-size="20"
          font-weight="bold"
          fill="#493A15"
        >
          ', format_m(r$initial_units), '
        </text>


        <!-- TOTAL UNITS -->

        <rect
          x="875"
          y="150"
          width="115"
          height="105"
          rx="10"
          fill="#6B3F2C"
          filter="url(#shadow)"
        />

        <text
          x="932"
          y="187"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="white"
        >
          Total Units
        </text>

        <text
          x="932"
          y="220"
          text-anchor="middle"
          font-size="21"
          font-weight="bold"
          fill="white"
        >
          ', format_m(r$total_units), '
        </text>


        <!-- REPEAT LABEL -->

        <rect
          x="765"
          y="40"
          width="145"
          height="55"
          rx="10"
          fill="#EEE3F5"
          stroke="#9A69BE"
          stroke-width="2"
        />

        <text
          x="837"
          y="63"
          text-anchor="middle"
          font-size="15"
          font-weight="bold"
          fill="#5C3974"
        >
          Repeat Units
        </text>

        <text
          x="837"
          y="84"
          text-anchor="middle"
          font-size="17"
          font-weight="bold"
          fill="#5C3974"
        >
          +', format_m(r$repeat_units), '
        </text>


        <!-- DROP-OFF BOXES -->

        <rect
          x="180"
          y="330"
          width="140"
          height="80"
          rx="10"
          fill="#F7D6D6"
          stroke="#D77D7D"
          stroke-width="1.5"
        />

        <text
          x="250"
          y="360"
          text-anchor="middle"
          font-size="16"
          font-weight="bold"
          fill="#6C3333"
        >
          Not Aware
        </text>

        <text
          x="250"
          y="389"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#6C3333"
        >
          ', format_m(r$not_aware), '
        </text>


        <rect
          x="380"
          y="330"
          width="140"
          height="80"
          rx="10"
          fill="#F7D6D6"
          stroke="#D77D7D"
          stroke-width="1.5"
        />

        <text
          x="450"
          y="360"
          text-anchor="middle"
          font-size="16"
          font-weight="bold"
          fill="#6C3333"
        >
          No Trial
        </text>

        <text
          x="450"
          y="389"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#6C3333"
        >
          ', format_m(r$no_trial), '
        </text>


        <rect
          x="580"
          y="330"
          width="150"
          height="80"
          rx="10"
          fill="#F7D6D6"
          stroke="#D77D7D"
          stroke-width="1.5"
        />

        <text
          x="655"
          y="357"
          text-anchor="middle"
          font-size="15"
          font-weight="bold"
          fill="#6C3333"
        >
          No Availability
        </text>

        <text
          x="655"
          y="389"
          text-anchor="middle"
          font-size="18"
          font-weight="bold"
          fill="#6C3333"
        >
          ', format_m(r$no_availability), '
        </text>


        <!-- STAGE PERCENTAGES -->

        <text
          x="210"
          y="90"
          text-anchor="middle"
          font-size="14"
          fill="#666666"
        >
          ', round(100 * r$aware_units / max(r$buying_units, .Machine$double.eps), 0), '% aware
        </text>

        <text
          x="410"
          y="90"
          text-anchor="middle"
          font-size="14"
          fill="#666666"
        >
          ', round(100 * r$trial_units / max(r$aware_units, .Machine$double.eps), 0), '% trial
        </text>

        <text
          x="610"
          y="90"
          text-anchor="middle"
          font-size="14"
          fill="#666666"
        >
          ', round(100 * r$initial_units / max(r$trial_units, .Machine$double.eps), 0), '% availability
        </text>

      </svg>
      '
      )
      
      HTML(svg)
   })
   
   
   observeEvent(input$clear, {
      
      updateNumericInput(session, "buying_units", value = 10)
      updateNumericInput(session, "awareness", value = 50)
      updateNumericInput(session, "trial", value = 30)
      updateNumericInput(session, "availability", value = 70)
      updateNumericInput(session, "repeat_rate", value = 20)
      updateNumericInput(session, "additional_units", value = 1)
      updateNumericInput(session, "revenue", value = 100)
      updateNumericInput(session, "cost", value = 50)
      
      results(NULL)
      inputs_changed(FALSE)
      
      updateActionButton(
         session,
         "calculate",
         label = "Calculate"
      )
   })
}

shinyApp(ui, server)