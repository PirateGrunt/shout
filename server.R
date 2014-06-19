library(shiny)
source("constants.R")

shinyServer(function(input, output) {
  
  Data = reactive({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    dfFile <- read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
    dfFile
  })
  
  tri = reactive({
    dfFile = Data()
    op = OriginPeriod(as.Date(dfFile$StartDate), as.Date(dfFile$EndDate))
    sm = StaticMeasure(op, Level=c("GL", "PremOps", "CA"), Measure=c("EarnedPremium", "IncurredLoss"))
    sm$EarnedPremium = dfFile$EarnedPremium
    sm
  })
  
  output$Data = renderTable( {as.data.frame(tri())} )
    
  output$Explore <- renderPlot( { p = plot(tri()) 
                                  print(p)})
  
  output$View = renderTable( {Data()} )
  
  output$Fit <- renderText( { "Plot model results here" })
  
  output$Diagnose = renderText( {"Show diagonses here"})
  
  output$Predict <- renderText( { "Plot predictions here" })
  
  output$Learn = renderText({"Lots of linked videos here"})

  output$About = renderText({ aboutHTML })
  
})