
server <- function(input, output) {
  
  output$mymap <- renderLeaflet({
    
    if(input$variables=="Straw/Thatch Roof (%)"){x <- Kanchan_Data$Straw_That}
    if(input$variables=="Galvanized Iron Roof (%)"){x <- Kanchan_Data$Galvanized}
    if(input$variables=="Tile Roof (%)"){x <- Kanchan_Data$Tile}
    if(input$variables=="RCC Roof (%)"){x <- Kanchan_Data$RCC}
    if(input$variables=="Wood Roof (%)"){x <- Kanchan_Data$Wood}
    if(input$variables=="Others (%)"){x <- Kanchan_Data$Others}
    
    pal <- colorFactor(
      palette = "viridis",
      domain = x # as.numeric(na.omit(x))
    )
    
    legend.title <- paste(paste0(input$variables, " ("), round(min(x, na.rm=T), 2), " - ", round(max(x, na.rm=T), 2), ")", sep="")
    
    leaflet(Kanchan_Data) %>%
      addTiles(group = "OSM (default)") %>%
      addProviderTiles("Stamen.Toner", group = "Toner") %>%
      addProviderTiles("Stamen.TonerLite", group = "Toner Lite") %>%
      addProviderTiles("CartoDB.Positron", group = "CartoDB") %>%
      addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.8, color = ~pal(x)) %>%
      addLegend("bottomright", pal = pal, values = ~x, title = legend.title, labFormat = labelFormat(suffix = ""), opacity = 0.3) %>%
      addLayersControl(baseGroups = c("OSM (default)", "Toner", "Toner Lite", "CartoDB"),options = layersControlOptions(collapsed = FALSE))
    
  })
}

# Run the application
shinyApp(ui = ui, server = server)