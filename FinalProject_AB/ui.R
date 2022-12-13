library(shiny)

ui <- fluidPage(leafletOutput("mymap", width = "100%", height = 500),
                absolutePanel(top=1, right=150,
                              selectInput("variables", "Roof Type in Kanchanpur District of Nepal (%):", c("Straw/Thatch Roof (%)", "Galvanized Iron Roof (%)", "Tile Roof (%)", "RCC Roof (%)", "Wood Roof (%)", "Others (%)"), selected="Straw/Thatch Roof (%)"))
)
