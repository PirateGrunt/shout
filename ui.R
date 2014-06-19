source("sidebarpanel.R")

shinyUI(
  fluidPage(
    titlePanel("MRMR - Multivariate Regression Models for Reserving"),
    sidebarLayout(
      sidebarPanel(
        sideAbout
        , sideData
        , sideExplore
        , sideView
        , sideFit
        , sideDiagnose
        , sidePredict
        , sideLearn
      ),
      
      mainPanel(
        tabsetPanel(id="tabs"
                    , tabPanel("Data", tableOutput("Data"))
                    , tabPanel("Explore", plotOutput("Explore"))
                    , tabPanel("View", tableOutput("View"))
                    , tabPanel("Fit", plotOutput("Fit"))
                    , tabPanel("Diagnose", plotOutput("Diagnose"))
                    , tabPanel("Predict", plotOutput("Predict"))
                    , tabPanel("Learn", tableOutput("Learn"))
                    , tabPanel("About", htmlOutput("About"))
        )
      )
    )
  )
)