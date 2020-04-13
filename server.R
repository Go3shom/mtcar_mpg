

library(shiny)
data(mtcars)
mt <- as.data.frame(mtcars)
mtFit <- lm(mpg ~ am + cyl + hp + wt, data = mt)

shinyServer(function(input, output) {
    mtPred <- reactive({
        amInput <- input$am
        cylInput <- input$cyl
        hpInput <- input$hp
        wtInput <- input$wt
        predict(mtFit,
                newdata = data.frame(
                    am = as.integer(amInput),
                    cyl = as.integer(cylInput),
                    hp = hpInput,
                    wt = wtInput
                ))
    })
    output$mpgPred <- renderText({
        mtPred()
    })
})