#====
# DATA
sideData = conditionalPanel(
  condition = "input.tabs =='Data'"
  , helpText("You may select one or more files for analysis, or select one of the sample data sets.")
  , radioButtons("whichData", "Select data source", choices=c(Friedland="Friedland", Multiline="Multiline", User="User"), selected="Friedland")
  , hr()
  , fileInput('file1', 'Choose CSV File from local drive, adjusting parameters if necessary',
              accept=c('text/csv', 'text/comma-separated-values,text/plain'))
  , checkboxInput('header', 'Header', TRUE)
  , selectInput('sep', 'Separator', choices=c(Comma=',', Semicolon=';',Tab='\t'), ',')
  , selectInput('quote', 'Quote', choices=c(None='','Double Quote'='"','Single Quote'="'"),'"')
  , hr()
  , helpText("Identify levels")
  , helpText("Identify static measures")
  , helpText("Identify stochasitc measures")
) 

#====
# EXPLORE
sideExplore = conditionalPanel(
  condition = "input.tabs == 'Explore'"
  , selectInput("selectResponse", "Response:"
                , choices = c("IncrementalPaid", "IncrementalReported"))
  , checkboxGroupInput("selectPredictor", "Predictor:" 
                       , choices = c("PriorCumulativePaid", "PriorCumulativeReported"
                                     , "OnLevelEarnedPremium", "EarnedExposure"))
  , checkboxGroupInput("selectGroup", "Group:"
                       , choices = c("DevelopmentLag", "Line", "Company"))
  , helpText("To download this data in triangular format, select the 'Numbers' tab.")
)

#====
# VIEW
sideView = conditionalPanel(
  condition="input.tabs == 'View'"
  , downloadButton('downloadData', 'Download')
)

#====
# FIT
sideFit = conditionalPanel(
  condition="input.tabs == 'Fit'"
  , selectInput("selectAlpha", "Alpha:"
                , choices = c(0, 1, 2))
)

#====
# DIAGNOSE
sideDiagnose = conditionalPanel(
  condition="input.tabs == 'Diagnose'"
  , helpText("Are there any controls here?")
)

#====
# PREDICT
sidePredict = conditionalPanel(
  condition="input.tabs == 'Predict'"
  , dateInput("datePredict", label = h3("Predict to:"), value="2020-01-01") 
)

#====
# LEARN
sideLearn = conditionalPanel(
  condition="input.tabs == 'Learn'"
  , helpText("Coming soon")
)

#====
# ABOUT
sideAbout = conditionalPanel(
  condition = "input.tabs == 'About'"
  , helpText("About MRMR")
)
