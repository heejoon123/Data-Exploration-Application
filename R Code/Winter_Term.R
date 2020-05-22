# Name: Heejoon Ahn
# Date: December 6, 2019
# QBS 195 Independent Study 

# DISCLAIMER: 
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

library(shiny)
library(shinyBS)
library(shinythemes)
library(datasets)
library(colourpicker)
library(ggplot2)
library(plotly)
library(reshape2)
library(ggcorrplot)
library(corrplot)
library(RColorBrewer)
library(tippy)
library(dplyr)
library(Hmisc)
library(lattice)
library(survival)
library(Formula)
library(gplots)
library(corrgram)

ui <- navbarPage(span(tagList(icon("github"), "dAbLication")), 
                 theme = shinytheme("flatly"),
        tabPanel(span(tagList(icon("home"))), 
            navlistPanel(widths=c(3,8),
                "Home",
                 tabPanel(span(tagList(icon("home"), "Main Menu")),
                      mainPanel(width = "100%", 
                          h1("Welcome to dAbLication!"),
                          h5("Author: Heejoon Ahn"),
                          br(),
                          p("Hello! We are pleased to see you!",
                            "The dAbLication is happy to greet you in your data visualization",
                            "tasks for your research!",
                            style="font-family: 'times'; font-si16pt"),
                          p("This is a prototype graphic user interface (GUI) generated for the",
                          "sole purpose of making data visualization easy for researchers.",
                          "Please be mindful that the program is still in its development phase!",
                          style="font-family: 'times'; font-si16pt"),
                          br(),
                          # p(strong("DISCLAIMER:"), "All rights belong to me, and the Ackerman Lab."),
                          p(span("Thank you so much!", style = "color:blue"), 
                            style="font-family: 'times'; font-si16pt"),
                          p(),
                          p("-Heejoon Ahn"),
                          img(src='https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Achtung.svg/220px-Achtung.svg.png', 
                              align = "center",
                              width = 250, height = 200)
                          
                      )
                 ),
                 
                "Help/Tutorials",
                 tabPanel(span(tagList(icon("upload"), "How to Upload Data")),
                          mainPanel(width="100%",
                              h1("How to Upload Data"),
                              br(),
                              p("The first step to using this data visualizaton tool is by",
                                "uploading the data file into this GUI. In the application,",
                                "click on the",
                                span(strong("Data"), style="color:blue"), "tab. Once there,",
                                "please click on the", span(strong("Browse"), style="color:blue"),
                                "button. This will lead you to a new window that asks you to",
                                "locate the csv file of interest. Upon selecting your csv file,",
                                "the data should display on the dashboard. You are able to scroll",
                                "through the data."),
                              br(),
                              p("Please remember that this application only loads CSV files,",
                              "and that it is optimal to load only", 
                              strong("clean"), "data files."),
                              p("On the bottom of the sidebar of the dashboard, the user",
                                "has the option to load/view just the top few rows of the data",
                                "which is labeled as 'head'. To load and view all of the data",
                                "please select the", strong('All'), "button.")
                          )
                 ),
                 tabPanel(span(tagList(icon("chart-line"), "2D Plotting")),
                          mainPanel(width="100%",
                                    h1("Plotting 2-Dimensional Plots"),
                                    br(),
                                    p("This tab starts the official data visualizaiton.",
                                      "The data uploaded earlier is linked to this tab",
                                      "and you can select the variables of interest.",
                                      "The drop-down menus allow you to select the X and Y axis.",
                                      "The Categorical Variable is only for certain plots:"),
                                    tags$ul(
                                        tags$li("Jitter"),
                                        tags$li("Categorical Scatterplot"),
                                        tags$li("Boxplot"),
                                        tags$li("Violin Plot")
                                    ),
                                    p("The statistical information on the bottom panel of the",
                                      "application is solely for the scatterplot. This part",
                                      "is still in its developmental phase."),
                                    br(),
                                    p("You as the user can swap between the plot options",
                                      "by selecting one of them by clicking on the button.",
                                      "The plots will naturally switch. And you can even",
                                      "change colors of the following plots for your own",
                                      "pleasure:"),
                                    tags$ul(
                                        tags$li("Scatterplot"),
                                        tags$li("Histogram")
                                    ),
                                    p("The plots are generated through plotly, and is interactive.",
                                      "Upon hovering over points or part of the plot, the ",
                                      "plot will provide information according to the plot type.")
                          )
                 ),
                 
                 tabPanel(span(tagList(icon("chart-bar"),"Correlational Matrices")),
                          mainPanel(width="100%",
                                    h1("Generating Correlational Matrices"),
                                    br(),
                                    p("This tab takes in the uploaded data from earlier,",
                                      "and it then asks the user to select multiple variables",
                                      "(minimum two for each menus). The data that is brought in",
                                      "is purely the data that had numerical values only.",
                                      "Once those variables of interest are selected, the",
                                      "dashboard will automatically generate a correlation matrix",
                                      "based on the Pearson correlation method."),
                                      p("The",span("Deselect", style="color:blue"),
                                      "button will instantaneously erase all selected variables.",
                                      "The", span("Select All", style="color:blue"),
                                      "button will instantaneously select all variables.",
                                      "To edit these, please", strong("unclick"), 
                                      "the buttons. Otherwise, those settings will remain and",
                                      "not change to your own attempted edits of variables."
                                    )
                          )
                 ),
                 
                 tabPanel(span(tagList(icon("chart-bar"),"Clusters")),
                          mainPanel(width="100%",
                                    h1("Generating Cluster Plots"),
                                    br(),
                                    p("This tab allows you to conduct clustering of the points",
                                      "via K-Means Clustering. As of now, this tab is not",
                                      "finished. But as of now, the user can select X and Y",
                                      "variables to plot and the number of clusters to look at.",
                                      "Keep in mind that the range is from 1 cluster to a total",
                                      "of 9 clusters. This application will most likely give you",
                                      "an error message if you attempt to go out of the pre-set",
                                      "range of clusters."),
                                    p("The", strong('X'), "symbols in the plot are representing",
                                      "the means calculated by Euclidean distance.",
                                      "To look at the information regarding how this K-means",
                                      "calculation is done, click on the link below:"),
                                    tags$a("https://en.wikipedia.org/wiki/K-means_clustering",
                                           href="https://en.wikipedia.org/wiki/K-means_clustering")
                          )
                 ),
                 
                 tabPanel(span(tagList(icon("calculator"),"Linear Regression")),
                          mainPanel(width="100%",
                                    h1("Calculating Linear Regression"),
                                    br(),
                                    p("This tab is for statistical analysis, where it specifically",
                                      "calculates the simple linear regression via R's",
                                      strong('lm()'), "function.")
                          )
                 ),
                 
                 tabPanel("Special Thanks",
                          mainPanel(width = "100%",
                              h5("This application would not have been possible without",
                              "the following tools. We would like to credit the following,"),
                              tags$ul(
                                  tags$li("RStudio"),
                                  tags$li("Shiny"),
                                  tags$li("GitHub"),
                                  tags$li("plotly"),
                                  tags$li("StackOverflow")
                              ))
                )
        )
        # hr(),
        # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
        ),
        tabPanel(span(tagList(icon("upload"), "Data")), 
                 titlePanel("Upload File"),
                 sidebarLayout(
                     sidebarPanel(
                         fileInput('file1', 'Choose CSV File',
                                   accept=c('text/csv', 
                                            'text/comma-separated-values,text/plain', 
                                            '.csv')),
                         
                         tags$br(),
                         checkboxInput('header', 'Header', TRUE),
                         radioButtons('sep', 'Separator',
                                      c(Comma=',',
                                        Semicolon=';',
                                        Tab='\t'),
                                      ','),
                         radioButtons('quote', 'Quote',
                                      c(None='',
                                        'Double Quote'='"',
                                        'Single Quote'="'"),
                                      '"'),
                         # Input: Select number of rows to display ----
                         radioButtons("disp", "Display",
                                      choices = c(Head = "head",
                                                  All = "all"),
                                      selected = "head")
                         
                     ),
                     mainPanel(
                         tableOutput('contents')
                     )
                 )
                 # hr(),
                 # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
        ),
        tabPanel(span(tagList(icon("chart-line"), "2D Plots")),
                 sidebarLayout(
                     sidebarPanel(
                         # "Empty inputs" - they will be updated after the data is uploaded
                         selectInput('xcol', 'X Variable', choices=NULL),
                         selectInput('ycol', 'Y Variable', "", choices=NULL),
                         selectInput('group', 'Categorical Variable', "", choices=NULL),
                         colourInput("col", "Select Color for All Points", "black"),
                         
                         # allowing other plot options
                         radioButtons("plot.type", "Plot Type",
                                      list("scatterplot", "jitter plot",
                                           "categorical scatterplot",
                                           "boxplot","histogram",
                                           "violin plot")),
                         # adding a download button to allow user to download plot
                         downloadButton("downloadPlot", "Download")
                         
                ),
                mainPanel(
                    plotlyOutput('MyPlot'),
                    # add text for output below the plot
                    h4("Slope: "), h5(verbatimTextOutput("slope")),
                    h4("Y-intercept: "), h5(verbatimTextOutput("y_int")),
                    h4("Pearson Correlation: "),h5(verbatimTextOutput("p_corr"))
                ))
                # hr(),
                # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
        ),
        tabPanel(span(tagList(icon("chart-bar"), "Correlational Plot")),
                 titlePanel("Symmetrical Correlational Plot"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("vars", "Choose one or more:", choices = NULL, 
                                     multiple = TRUE),
                         selectInput("vars2", "Choose one or more:", choices=NULL,
                                     multiple =TRUE),
                         #checkboxGroupInput('vars', 'Variables', choices=NULL),
                         checkboxInput("selectall","Select All", value=FALSE),
                         checkboxInput("unselectall", "Deselect", value=FALSE),
                         # QUESTION: ADD A SECONDARY SCATTERPLOT FOR CATEGORICAL?
                         radioButtons("cor.type", "Visual Type", 
                                      list("Correlational Matrix", 
                                           "Correlation-Scatterplot")),
                         # adding a download button to allow user to download plot
                         downloadButton("downloadCorPlot", "Download")
                         ),
                     mainPanel(plotOutput("CorPlot", height="600px"))
                 )
                 # hr(),
                 # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
                 ),
        tabPanel(span(tagList(icon("chart-bar"),"Clustering")),
                 titlePanel("K-Means Clustering"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput('x', 'X Variable', choices=NULL),
                         selectInput('y', 'Y Variable', "", choices=NULL),
                         numericInput('clusters', 'Cluster count', 3,min = 1, max = 9)
                     ),
                     mainPanel(plotOutput('kmeansPlot'))
                 )
                 # hr(),
                 # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
                 ),
        
        tabPanel(span(tagList(icon("calculator"), "Linear Regression")),
                 titlePanel("Linear Regression"),
                 sidebarLayout(
                     sidebarPanel(
                         # "Empty inputs" - they will be updated after the data is uploaded
                         selectInput('xvar', 'X Variable', choices=NULL),
                         selectInput('yvar', 'Y Variable', "", choices=NULL)
                     ),
                     # Print the summary statistic for Linear Regression
                     mainPanel(verbatimTextOutput("summary"))
                 )
                 # hr(),
                 # print("Copyright (c) 2020 Heejoon Ahn, USA. All rights reserved.")
                 )
)

server <- shinyServer(function(input, output, session) {
    #render the UI for plots
    output$MyPlot <- renderPlotly({ plotInput() })
    
    # render the UI for correlation plots
    output$CorPlot <- renderPlot({ correlation() })
    
    # render the UI for clustering
    output$kmeansPlot <- renderPlot({ clusterPlot() })
    
    output$summary <- renderPrint({
        fit <- lm(data()[,input$yvar] ~ data()[,input$xvar])
        names(fit$coefficients) <- c("Intercept", input$xvar)
        summary(fit)
    })
    ### render the UI text for the linear regression
    output$slope <- renderPrint({
        paste(calc_lm()[1])
    })
    output$y_int <- renderPrint({
        paste(calc_lm()[2])
    })
    output$p_corr <- renderPrint({
        paste(calc_lm()[3])
    })
    
    ### reading in the file
    data <- reactive({ 
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        # scatter
        updateSelectInput(session, inputId = 'xcol', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId='group', label='Categorical Variable',
                          choices=names(df), selected=names(df))
        
        # for linear regression calculation
        updateSelectInput(session, inputId = 'xvar', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'yvar', label = 'Y Variable',
                          choices = names(select_if(df, is.numeric)),
                          selected = names(select_if(df, is.numeric)))
        
        # for clustering
        updateSelectInput(session, inputId = 'x', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'y', label = 'Y Variable',
                          choices = names(df), selected = names(df))

        
        if(input$disp == "head") {
            return(head(df))
        }
        else {
            return(df)
        }

    })
    
    # produce table from inputted csv file
    output$contents <- renderTable({ data()})
    
    # allow for selection of colors
    colorPoint <- reactive({c(input$col)})
    
    # calcuate the linear regression 
    calc_lm <- function(){
        result <- lm(data()[,input$ycol] ~ data()[,input$xcol])
        slope <- result[[1]][2]
        y_int <- result[[1]][1]
        p_corr <- cor(x=data()[,input$xcol], y=data()[,input$ycol], method="pearson")
        model <- c(slope, y_int, p_corr)
        model
    }
    
    plotInput<- function(){
        plot_type <- switch(input$plot.type,
                            "scatterplot" = ggplot(data(), 
                                                   aes_string(x=input$xcol, 
                                                              y=input$ycol))+
                                geom_point(aes(color=colorPoint()))+
                                geom_smooth(method='lm')+
                                scale_color_manual(values=colorPoint()),
                            "jitter plot" = ggplot(data(),
                                                   aes_string(x=input$group,
                                                              y=input$ycol,
                                                              col=input$group))+
                                geom_jitter(),
                            "categorical scatterplot" = ggplot(data(),
                                                               aes_string(x=input$xcol,
                                                                          y=input$ycol,
                                                                          col=input$group))+
                                geom_point(),
                            "boxplot" = ggplot(data(), 
                                               aes_string(x=input$group, 
                                                          y=input$ycol,
                                                          fill=input$group))+
                                geom_boxplot(),
                            "histogram" = ggplot(data(), 
                                                 aes_string(x=input$xcol))+
                                geom_histogram(alpha = 0.9, fill=colorPoint(), 
                                               col=colorPoint())+
                                scale_color_manual(values=colorPoint()),
                            "violin plot" = ggplot(data(),
                                                   aes_string(x=input$group,
                                                              y=input$ycol,
                                                              fill=input$group))+
                                geom_violin(alpha=0.8, trim=FALSE)+
                                stat_summary(fun.data=mean_sdl, fun.args=list(mult=1), 
                                             geom="pointrange", color=colorPoint()))
        
        if(input$plot.type == "categorical scatterplot"){
            gg <- plot_type + theme_minimal()
        } else {
            gg <- plot_type+theme_minimal()+theme(legend.position = "none")
        }
        gg
    }
    
    cordf1 <- reactive({
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        df <- select_if(df, is.numeric)
        
        updateCheckboxInput(session, 'selectall', label="Select All")
        updateCheckboxInput(session, "unselectall", label="Deselect")
        
        # Can also set the label and select items
        if (input$selectall==TRUE){
            updateSelectInput(session, "vars", label = "Variables (Top)",
                              choices = names(df), selected = names(df))
        }
        else if(is.null(input$vars)){
            updateSelectInput(session, "vars", label = "Variables (Top)", choices = names(df))
        }
        if(input$unselectall==TRUE){
            updateCheckboxInput(session, "selectall", label="Select All", value=FALSE)
            updateSelectInput(session, "vars", label="Variables (Top)", choices=names(df),
                              selected=NULL)
        }
        df1 <- na.omit(df[input$vars])
    })
    
    cordf2 <- reactive({
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        df <- select_if(df, is.numeric)
        
        updateCheckboxInput(session, 'selectall', label="Select All")
        updateCheckboxInput(session, "unselectall", label="Deselect")
        
        if (input$selectall==TRUE){
            updateSelectInput(session, "vars2", "Variables (Left)", choices=names(df),
                              selected=names(df))
        }
        else if(is.null(input$vars)){
            updateSelectInput(session, "vars2", label="Variables (Left)", choices=names(df))
        }
        if(input$unselectall==TRUE){
            updateCheckboxInput(session, "selectall", label="Select All", value=FALSE)
            updateSelectInput(session, "vars2", label="Variables (Left)", choices=names(df),
                              selected=NULL)
        }
        df2 <- na.omit(df[input$vars2])
    })

    # for data input and then updates to make ggplot
    correlation <- function(){
        df1 <- cordf1()
        df2 <- cordf2()
        
        myscatter_lower <- function(data,
                                    point_color = "blue",
                                    border_color = "grey60",
                                    point_size = 2) {
            
            drawcell <- function(fx, fy, datax, datay) {
                
                oldpar <- par(mar = c(0,0,0,0), bg = "white")
                on.exit(par(oldpar), add = TRUE)
                
                norm01 <- function(x) {
                    xmin <- min(x)
                    xmax <- max(x)
                    (x - xmin) / (xmax - xmin)
                }
                
                # scatterplot
                points(fx + norm01(datax) * .8 + .1 - .5,
                       fy + norm01(datay) * .8 + .1 - .5,
                       pch = '.', col = point_color, cex = point_size)
                
                # border of the cell
                symbols(fx, fy, rectangles = matrix(1, 1, 2),
                        add = TRUE, inches = FALSE, fg = border_color, bg = NA)
            }
            for (x in 1:ncol(data)) {
                for (y in x:ncol(data)) {
                    if (x != y) {
                        drawcell(x, ncol(data) - y + 1, data[,x], data[,y])
                    }
                }
            }
            
        }
        
        cor_mat <- cor(df1, df2)
        merged.df <- merge(df1,df2)
        
        myplot <- function(){
            order <- corrMatOrder(cor(df1,df2), order = "hclust")
            corrplot(cor_mat, type="upper", method = "color", 
                     order = "hclust", tl.pos="tl",
                     tl.cex = 0.7, col=brewer.pal(n=11, name="PuOr"), tl.col="grey19")
            myscatter_lower(merged.df[,order])
        }
        
        corPlot <- corrplot(cor_mat, type="upper", method = "color", 
                            order = "hclust", 
                            col=brewer.pal(n=11, name="PuOr"),
                            tl.col="grey19")
        
        cor_type <- switch(input$cor.type,
                           "Correlational Matrix" = corrplot(cor_mat, 
                                                             type="upper", 
                                                             method = "color", 
                                                             order = "hclust", 
                                                             col=brewer.pal(n=11, name="PuOr"),
                                                             tl.col="grey19"),
                           "Correlation-Scatterplot" = myplot())
        
        
        cor_type
        
    }
    
    # for clustering purposes
    selectedData <- reactive({
        chosen_data <- data()[,c(input$x, input$y)]
        chosen_data
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    clusterPlot <- reactive({
        palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
    # download scatterplot
    output$downloadPlot <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = scatterInput(), device = "png")
    })
    # download jitter plot
    output$downloadJitter <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = jitterInput(), device = "png")
        })
    # download categorical scatterplot 
    output$downloadCat <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = cat.scat(), device = "png")
        })
    # download correlation matrix
    output$downloadCorPlot <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = correlation(), device = "png", height=8, units = "in")
        }) 

})

shinyApp(ui, server)

