x <- seq(from=0, to=1, by = 0.01)
xlab <- "p(class 1)"
ylab <- "Entropy"
y <- -(x * log2 (x) + (1-x)*log2(1-x))
y[y == "NaN"]= 0
size <- 10
shape <- "O"
df <- data.frame(x,y)

shinyServer(function(input, output) {

    output$entropyCurve <- renderPlot({
      entropyPlot <- reactive({
          plot(x,y, xlab = xlab, ylab = ylab, col= 'blue', main = 'Entropy')
          points(x= x[z], y = y[z], col='Red', pch = 2, lwd = 3)
          lines(c(0.5,x[z]), c(0,y[z]), col = "Red", lwd = 1)
          text(0.07, 0.95, paste("p(class 1) = ", (z-1)/100))
          text(0.07, 0.88, paste("p(class 2) = ", (101-z)/100))
          text(0.07, 0.81, paste("Entropy = ", round(y[z], 2)))
      })

      z <- reactiveValues()
#      observeEvent(input$p1, {
        z <- input$p1 + 1
        data <- entropyPlot()
#     })
      observeEvent(input$btn2, {
        z <- round(y[input$n1/(input$n1+input$n2) * 100 + 1])
        data <- entropyPlot() 
      })
    })
    output$probC1 <- renderText({paste('Number of Instances of Class 1: ', input$n1)})
    output$probC2 <- renderText({paste('Number of Instances of Class 2: ', input$n2)})
    output$entropyValue <- renderText({
        input$btn1
        isolate(ntrpy <- round(y[input$n1/(input$n1+input$n2)*100+1],2))
        isolate(paste('Entropy of the 2-Class System : ', ntrpy))
  })
})
