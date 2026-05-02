library(shiny)
library(leaflet)
library(shinyBS)  # Load the shinyBS package

# setwd("C:/Users/14145/Documents/GitHub/mtdunst.github.io/Chicago Map App")
# rsconnect::writeManifest()
ui <- fluidPage(
  titlePanel("Where Should I Live in Chicago?"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("generate",
                   "Generate Personal Rentability Map",
                   width="100%",
                   style="color: #ECFFDC; background-color: #40826D; border-color: #ECFFDC"),
      tags$br(), tags$br(),  # Add space between the button and accordion panels
      bsCollapse(id = "accordion", open = "Sliders",  # Create the accordion panel
                 bsCollapsePanel("Neighborhood Character", uiOutput("weights1"), style = "warning"),  # Add the sliders to the first accordion panel
                 bsCollapsePanel("Quality of Life", uiOutput("weights2"), style = "success"),  # Add the sliders to the second accordion panel
                 bsCollapsePanel("Transportation", uiOutput("weights3"), style = "info")   # Add the sliders to the third accordion panel
      )
    ),
    
    mainPanel(
      leafletOutput("map", height = "80vh")
    )
  ),
  
  tags$head(
    tags$style(HTML("
      #map {
        height: 80vh;
      }
    "))
  )
)





library(shiny)
library(terra)
library(leaflet)

server <- function(input, output, session) {
  
  # Hardcoded folder path containing .tif files
  folder_path <- "Data layers"  # Replace with the actual path to your .tif folder
  
  # List all .tif files in the folder
  files <- list.files(folder_path, pattern = "\\.tif$", full.names = TRUE)
  
  # Define names for the raster layers
  layer_names <- c("Historic Neighborhood",
                   "Near Major Grocery Store",
                   "Parks",
                   "Library",
                   "Crime",
                   "El Track Noise",
                   "Railroad Track Noise",
                   "Train Track Noise",
                   "Freeway Noise",
                   "Proximity to Industrial Land",
                   "School Quality",
                   "Transit",
                   "Driving",
                   "Near El Station",
                   "Bus",
                   "Near Divvy Station",
                   "Near Metra Station",
                   "Bike Network",
                   "24-hr Bus")
  
  # Load one raster initially to get its extent and center coordinates
  initial_raster <- rast(files[1])
  initial_extent <- ext(initial_raster)
  initial_center <- c(mean(c(initial_extent[1], initial_extent[2])), mean(c(initial_extent[3], initial_extent[4])))

  
  # Split the layers into three categories
  layers1 <- layer_names[1:4]
  layers2 <- layer_names[5:11]
  layers3 <- layer_names[12:19]
  
  # Create weight inputs for each layer in the first category
  output$weights1 <- renderUI({
    weight_inputs <- lapply(seq_along(layers1), function(i) {
      sliderInput(
        inputId = paste0("weight_", i), 
        label = paste0(layers1[i], " Weight:"), 
        min = 1, 
        max = 5, 
        value = 1
      )
    })
    do.call(tagList, weight_inputs)
  })
  
  # Create weight inputs for each layer in the second category
  output$weights2 <- renderUI({
    weight_inputs <- lapply(seq_along(layers2), function(i) {
      sliderInput(
        inputId = paste0("weight_", i + length(layers1)), 
        label = paste0(layers2[i], " Weight:"), 
        min = 1, 
        max = 5, 
        value = 1
      )
    })
    do.call(tagList, weight_inputs)
  })
  
  # Create weight inputs for each layer in the third category
  output$weights3 <- renderUI({
    weight_inputs <- lapply(seq_along(layers3), function(i) {
      sliderInput(
        inputId = paste0("weight_", i + length(layers1) + length(layers2)), 
        label = paste0(layers3[i], " Weight:"), 
        min = 1, 
        max = 5, 
        value = 1
      )
    })
    do.call(tagList, weight_inputs)
  })
  
  master_raster <- reactiveVal(NULL)
  
  observeEvent(input$generate, {
    req(files)
    print("Loading and summing raster files...")
    
    # Load and sum the weighted rasters
    master_raster_obj <- NULL
    for (i in seq_along(files)) {
      # browser()
      weight <- if (is.null(input[[paste0("weight_", i)]])) 1 else input[[paste0("weight_", i)]]
      raster <- rast(files[i])
      weighted_raster <- raster * weight
      if (is.null(master_raster_obj)) {
        master_raster_obj <- weighted_raster
      } else {
        master_raster_obj <- master_raster_obj + weighted_raster
      }
    }
    
    master_raster(master_raster_obj)
    
    # Display the master raster
    output$map <- renderLeaflet({
      leaflet() %>%
        addProviderTiles("Stadia.AlidadeSmooth") %>%  # Change tiles to something more minimal
        addRasterImage(master_raster_obj, opacity = 0.8, colors = colorNumeric(c("#800080", "#E6E1BC", "#228B22"), domain = NULL, na.color = "#00000000"))  # Adjust raster opacity and palette
    })
  })
  
  # Initialize the map with the extent and center coordinates of the initial raster
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("CartoDB.PositronNoLabels") %>%
      setView(lng = initial_center[1], lat = initial_center[2], zoom = 10)  # Adjust zoom level as needed
  })
}

shinyApp(ui = ui, server = server)
