shinyUI(fluidPage(
    titlePanel("Entropy of a Two-Class Variable"),
    sidebarLayout(
      sidebarPanel(
          numericInput("n1", label = "Number of Class 1 instances: ", value = 0),
          numericInput("n2", label = "Number of Class 2 instances: ", value = 0),
          actionButton("btn1", label = "Press to Calculate Entropy"),
          p(),

# Wanted to make the app synchronize the graph with the press of this button, but
# can NOT get it to work. So, made this chunk of code inactive
#          actionButton("btn2", label = "Press to Synchronize Plot"),
#          p(),

          sliderInput("p1", label = "Probability of Class 1:", min = 0, max = 100, value = 0)
      ),

    mainPanel(
      tabsetPanel(
        tabPanel("Supporting Documentation",
          helpText("Entropy is a measure of 'purity' of data instances in a class."),
          helpText("Purity means how Homogenous observations are in a class (attribute / predictive variable)"), 
          helpText("with respect to the Target variable."),
          helpText("This application calculates the 'Entropy' of a 2-class variable in two ways. You can:"),
          helpText("1. Either enter the number of observations (instances) of each of the two classes"),
          helpText("in the input fields on the side panel. Then:"),
          helpText('You must click the "Press to Calculate Entropy" button to calculate the Entropy.'),
          helpText("2. Or, you can adjust the probability (percentage) of class 1 on the slider in the side panel."),
          helpText("The interactive plot will then show the 'Entropy' on a plot."),
          helpText('Click on the "Entropy Calculator" tab on the top to see the results....')
        ),
        tabPanel("Entropy Calculator",
                  textOutput('probC1'),
                  textOutput('probC2'),
                  textOutput('entropyValue'),
                  plotOutput('entropyCurve'))
      )
    )
  )
))
