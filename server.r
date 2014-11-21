library(UsingR)
data(galton)
predictfunction <- function(invalue){fit <- lm(child ~ parent,data=galton)
                                    predict(fit, newdata = data.frame(parent=c(invalue)))}

shinyServer(
  function(input, output) {
      output$newSizePoint  <- renderPlot(width = 450, height = 450,{
      freqData <- as.data.frame(table(galton$child, galton$parent))
      names(freqData) <- c("child", "parent", "freq")
      plot(as.numeric(as.vector(freqData$parent)), 
           as.numeric(as.vector(freqData$child)),
           pch = 21, col = "black", bg = "lightblue",
           cex = .15 * freqData$freq, 
           xlab = "parent", ylab = "child")
      fit <- lm(child ~ parent,data=galton)
      lines(galton$parent,fit$fitted,col="red",lwd=3)
      points(mean(galton$parent), mean(galton$child), col='red',cex = 2, pch = 19)
      prediction <- predict(fit, newdata = data.frame(parent=c(input$parent)))
      points(input$parent, prediction, col='blue',cex = 2, pch = 19)      
      lines(c(input$parent,input$parent),c(60,prediction),col="blue",lwd=1)
      lines(c(60,input$parent),c(prediction,prediction),col="blue",lwd=1)
      }) 
      
      output$value <- renderPrint({input$parent})
      output$child <- renderPrint({predictfunction(input$parent)[[1]]})
  }
)
