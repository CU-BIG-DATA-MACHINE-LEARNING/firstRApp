install.packages(c('shiny','shinythemes'))

library(shiny)
library(shinythemes)


# UI = User interface

#Server = Work and calculations behind the scenes

ui<- fluidPage(theme=shinytheme("cerulean"),
  navbarPage("My First App",
      tabPanel("Navbar1",
          sidebarPanel(
              tags$h3("Input:"),
              textInput("txt1", "First Name", "Enter your first name")
            
          )     
      ),
      mainPanel(
        h1("Header 1"),
        h4("Output 1"),
        verbatimTextOutput("txtout")
      )
   )           
)  

server<- function(input, output){
  output$txtout<-renderText({
    paste(input$txt1)
  })
}

shinyApp(ui=ui, server=server)
