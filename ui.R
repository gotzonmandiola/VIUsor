ui <- fluidPage( #MENU TAB----
                 
                 navbarPage(
                   title = tags$img(HTML("<a href='https://www.universidadviu.com/es/master-ingenieria-gestion-ambiental' target='_blank'><img src='Logo_VIU.png' height = '45px'></a>")),
                   id = "navBar",
                   theme = shinytheme('lumen'),
                   fluid = TRUE,
                   inverse = TRUE,
                   windowTitle= tags$head(
                     # tags$link(rel = "icon", type = "image/png", href = "imagen.png"),
                     tags$title("VIUsor")
                   ),
                   tabPanel("Visor", value = "visor",
                            fluidRow(
                              withSpinner(leafletOutput(outputId = 'map', width = "100%", height = "800px"), type = "1", color = "#E65014")
                            )
                   )
                 )
)#close fluidpage