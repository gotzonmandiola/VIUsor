server = function(input, output, session){
  
  output$map = renderLeaflet({ #MAPA ----
    
    leaflet() %>%
      
      #Capas base ----
    
    # addTiles(group = "OSM (default)") %>%
    addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>%
      addMouseCoordinates()%>%
      
      #Capas a plotear ----
    
    #Zona de estudio
    
    addPolygons(data = study_area, group = "Zona de estudio<hr><strong>Actividades excluyentes:</strong>", 
                color = "blue", weight = 1, opacity = 0.5, fill = "blue", stroke = TRUE, label = as.character(study_area$Sovereign1))%>%
      
      #Zona excluyente
      
      addPolylines(data = militar_area, group = "Area militar", color = "green", weight = 1, opacity = 0.8, fill = "green")%>%
      addPolylines(data = pipeline, group = "Tuberias", color = "brown", weight = 3)%>%
      addPolylines(data = cables, group = "Cables", weight = 2, color = "red")%>%
      addCircles(data = acuaculture, group = "Acuicultura<hr><strong>Actividades limitantes:</strong>", color = "white", radius = 1, stroke = TRUE)%>%
      
      #Zona limitante
      
      addPolylines(data = mpa, group = "Zonas protegidas", color = "#00ffc8", weight = 1, opacity = 0.6, fill = "#00ffc8")%>%
      addCircles(data = energy_device, group = "Instalaciones de energia", color = "#d4ff00", radius = 1, stroke = TRUE)%>%
      
      #Controles capas ----
    addLayersControl(
      # baseGroups = c("OSM (default)", "Toner", "Toner Lite", "World Street Map", "World Imagery"),
      overlayGroups = c("Zona de estudio<hr><strong>Actividades excluyentes:</strong>", "Area militar", "Tuberias", "Cables",
                        "Acuicultura<hr><strong>Actividades limitantes:</strong>", "Zonas protegidas","Instalaciones de energia"),
      options = layersControlOptions(collapsed = TRUE), position = "topleft")%>%
      
      hideGroup(c("Area militar", "Tuberias", "Cables",
                  "Acuicultura<hr><strong>Actividades limitantes:</strong>", "Zonas protegidas","Instalaciones de energia")
      )%>%
      
      #Controles adicionales ----
    
    addMeasure(position = "topleft", primaryLengthUnit = "kilometers", primaryAreaUnit = "hectares", secondaryLengthUnit = "meters", secondaryAreaUnit = "sqmeters", localization = "es")%>%
      addScaleBar(options=scaleBarOptions(imperial=FALSE), position = "topleft")%>%
      addMiniMap(tiles = providers$OpenStreetMap.Mapnik, toggleDisplay = TRUE, position = "bottomleft", minimized = TRUE)
    
  })
}