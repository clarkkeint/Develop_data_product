# Define UI for application that predict child's height from parents' height
shinyUI(pageWithSidebar(
  headerPanel("Predict children's height by parents'  height"),  
  sidebarPanel(
    h4('Use the bar below to input parent\'s height'),
    # Input parents' height
    sliderInput('parent', 'Parent\'s height (inche)',value = 66, min = 64, max = 73, step = 0.05,),
    # Give some introduction
    h4('Introduction:'),
    h5('* This App is used to predict child\'s height from parents\' height.'), 
    h5('* The data set are from Galton\'s height data for parents and children in 1885.'),
    h5('* There is a correction for gender via multiplying female heights by 1.08.'),
    h5('* The size of green points represent the frequency of data in that point.'),
    h5('* The red point represent the mean value of parents\' and children\'s height. '),
    h5('* The red line are fitted line by the simple linear regression.'),
    h5('* The blue point are pair of prediction of child\'s height and inputed parent\'s height.')
    ),
  mainPanel(
    # Show the input value
    h4('You entered Parent\'s height is : (inche)'),
    verbatimTextOutput("value"),
    # Show predict value
    h4('Prediction of children\'s height is : (inche)'),
    verbatimTextOutput("child"), 
    # Plot a regression line and data points
    h4('Fitted line'),
    plotOutput('newSizePoint')
    
  )
))