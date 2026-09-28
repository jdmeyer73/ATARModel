library(shiny)

ui <- fluidPage(
   
   tags$head(
      tags$style(HTML("
      body {
        background-color: #f5f5f5;
        font-family: Arial, sans-serif;
      }

      .model-container {
        max-width: 950px;
        margin: 30px auto;
        background: white;
        padding: 30px 40px;
        border: 1px solid #cccccc;
      }

      .model-title {
        font-size: 26px;
        font-weight: bold;
        color: #5b3322;
        margin-bottom: 30px;
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

      .calculate-button {
        background-color: #f57c00;
        color: black;
        font-weight: bold;
        border: 1px solid #555;
        margin-top: 15px;
        margin-right: 15px;
      }

      .calculate-button:hover {
        background-color: #e66f00;
        color: white;
      }

      .clear-button {
        margin-top: 15px;
      }

      .result-highlight {
        font-size: 28px;
        font-weight: bold;
      }
    "))
   ),
   
   div(
      class = "model-container",
      
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
               value = 50,
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
               value = 30,
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
         ),
         
         div(
            style = "margin-top: 30px; padding-top: 20px; border-top: 1px solid #dddddd;",
            
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
      )
   )
)

server <- function(input, output, session) {
   
   results <- reactiveVal(NULL)
   inputs_changed <- reactiveVal(FALSE)
   
   # CALCULATE
   observeEvent(input$calculate, {
      
      units <-
         input$buying_units *
         (input$awareness / 100) *
         (input$trial / 100) *
         (input$availability / 100) *
         (1 + (input$repeat_rate / 100) *
             input$additional_units)
      
      profit_unit <-
         input$revenue - input$cost
      
      total_profit <-
         units * profit_unit
      
      results(
         list(
            units = units,
            profit_unit = profit_unit,
            profit = total_profit
         )
      )
      
      inputs_changed(FALSE)
      
      updateActionButton(
         session,
         "calculate",
         label = "Recalculate"
      )
   })
   
   
   # WATCH FOR INPUT CHANGES
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
         
         # Only flag a change if a calculation already exists
         if (!is.null(results())) {
            inputs_changed(TRUE)
         }
         
      },
      ignoreInit = TRUE
   )
   
   
   # STATUS MESSAGE
   output$status_message <- renderUI({
      
      if (is.null(results())) {
         
         span(
            style = "color: #666666;",
            "Enter assumptions and click Calculate."
         )
         
      } else if (inputs_changed()) {
         
         span(
            style = "color: #b35c00; font-weight: bold;",
            "Inputs changed — click Recalculate to update the forecast."
         )
         
      } else {
         
         span(
            style = "color: #2e7d32; font-weight: bold;",
            "Forecast is current."
         )
      }
      
   })
   
   
   # UNITS SOLD
   output$units_sold <- renderText({
      
      req(results())
      
      format(
         round(results()$units, 3),
         nsmall = 2,
         trim = TRUE
      )
   })
   
   
   # PROFIT PER UNIT
   output$profit_per_unit <- renderText({
      
      req(results())
      
      format(
         round(results()$profit_unit, 2),
         nsmall = 2
      )
   })
   
   
   # TOTAL PROFIT
   output$profit <- renderText({
      
      req(results())
      
      paste0(
         "$",
         format(
            round(results()$profit, 2),
            nsmall = 2,
            big.mark = ","
         )
      )
   })
   
   
   # CLEAR
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