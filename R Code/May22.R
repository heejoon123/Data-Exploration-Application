#' Name: Heejoon Ahn
#' Date: April 9, 2020
#' Project: Updated shiny application
#' 
#' DISCLAIMER: This code rightfully belongs to Heejoon Ahn

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
library(d3heatmap)
library(Rtsne)

# Define UI for application that draws a histogram
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
          )),
         navbarMenu(span(tagList(icon("upload"), "Data")),
             tabPanel("Upload File", 
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
                  )),
             tabPanel("Handle Data",
                      titlePanel("Data"),
                      sidebarLayout(
                          sidebarPanel(
                              #' allow selection of multiple columns from data 
                              #' that has been uploaded previously.
                              #' The data looked at here won't affect plotting 
                              #' and is merely intended for data viewing purposes
                              selectInput("colchoice", "Columns of interest:", 
                                          choices = NULL, 
                                          multiple = TRUE),
                              #' the following is to download the table that gets 
                              #' generated. 
                              downloadButton("downloadDataTable", "Download")
                              ),
                          mainPanel(
                              DT::dataTableOutput('selectTable')
                          )
                      ))
         ),
         navbarMenu(span(tagList(icon("chart-line"), "2D Plots")),
            tabPanel("scatterplot",
                 titlePanel("Scatterplot"),
                 sidebarLayout(
                     sidebarPanel(
                         #' "Empty inputs" - they will be updated after the data 
                         #' is uploaded
                         selectInput('xcol', 'X Variable', choices=NULL),
                         selectInput('ycol', 'Y Variable', "", choices=NULL),
                         colourInput("col", "Select Color for All Points", "black"),
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
             ),
            tabPanel("categorical scatter",
                 titlePanel("Categorical Scatterplot"),
                 sidebarLayout(
                     sidebarPanel(
                         #' "Empty inputs" - they will be updated after the data 
                         #' is uploaded
                         selectInput('xcol_cat', 'X Variable', choices=NULL),
                         selectInput('ycol_cat', 'Y Variable', "", choices=NULL),
                         selectInput('group', 'Categorical Variable', "", choices=NULL),
                         # adding a download button to allow user to download plot
                         downloadButton("downloadCatScat", "Download")
                     ),
                     mainPanel(
                         plotlyOutput('catscatter')
                     ))
            ),
            tabPanel("jitter",
                 titlePanel("Jitter Plot"),
                 sidebarLayout(
                     sidebarPanel(
                         #' "Empty inputs" - they will be updated after the data 
                         #' is uploaded
                         selectInput('j_group', 'X Variable', choices=NULL),
                         selectInput('j_ycol', 'Y Variable', "", choices=NULL),
                         # adding a download button to allow user to download plot
                         downloadButton("downloadjitter", "Download")
                     ),
                     mainPanel(
                         plotlyOutput('jitterPlot')
                     ))
            ),
            tabPanel("boxplot",
                     titlePanel("Boxplots"),
                     sidebarLayout(
                         sidebarPanel(
                             #' "Empty inputs" - they will be updated after the data 
                             #' is uploaded
                             selectInput('box_group', 'X Variable', choices=NULL),
                             selectInput('boxcol', 'Y Variable', "", choices=NULL),
                             # adding a download button to allow user to download plot
                             downloadButton("downloadbox", "Download")
                         ),
                         mainPanel(
                             plotlyOutput('boxPlot')
                         ))
            ),
            tabPanel("histogram",
                     titlePanel("Histogram"),
                     sidebarLayout(
                         sidebarPanel(
                             #' "Empty inputs" - they will be updated after the data 
                             #' is uploaded
                             selectInput('hist_x', 'X Variable', choices=NULL),
                             colourInput("hcol", "Select Color for All Points", "black"),
                             # adding a download button to allow user to download plot
                             downloadButton("downloadhist", "Download")
                         ),
                         mainPanel(
                             plotlyOutput('histPlot')
                         ))
            ),
            tabPanel("violin plot",
                     titlePanel("Violin Plot"),
                     sidebarLayout(
                         sidebarPanel(
                             #' "Empty inputs" - they will be updated after the data 
                             #' is uploaded
                             selectInput('violin_group', 'X Variable', choices=NULL),
                             selectInput('violincol', 'Y Variable', "", choices=NULL),
                             # adding a download button to allow user to download plot
                             downloadButton("downloadviolin", "Download")
                         ),
                         mainPanel(
                             plotlyOutput('violinPlot')
                         ))
            )
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
        tabPanel(span(tagList(icon("chart-bar"),"Heatmap")),
                 titlePanel("Heatmap"),
                 sidebarLayout(
                     sidebarPanel(
                     # adding a download button to allow user to download plot
                     downloadButton("downloadHM", "Download")
                 ),
                 mainPanel(plotOutput("HeatMap", height="600px"))
                 )
        ),
        navbarMenu(span(tagList(icon("chart-bar"),"More Plots")),
            tabPanel("K-Means Clustering",
                     titlePanel("K-Means"),
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
            tabPanel("PCA",
                     titlePanel("Principal Component Analysis"),
                     sidebarLayout(
                         sidebarPanel(
                             # these inputs are for both plots
                             selectInput('pca_vars', 'Choose Columns:', choices=NULL,
                                         multiple=TRUE),
                             selectInput('pcaN1', 'Choose Dimension 1:', choices=NULL),
                             selectInput('pcaN2', "Choose Dimension 2:", choices=NULL),
                             selectInput('pca_color', "Individual PCA?", 
                                         choices=NULL),
                             selectInput('pca_group', 
                                         'Choose Group (Individual PCA only):',
                                         choices=NULL),
                             
                             # switch between feature vs. subject PCA plots
                             radioButtons('pca.type', 'PCA Plot Type:',
                                          list('PCA of Features',
                                               'PCA of Individuals')),
                             
                             checkboxInput("pca_selectall","Select All", value=FALSE),
                             checkboxInput("pca_unselectall", "Deselect", value=FALSE)
                         ),
                         mainPanel(plotlyOutput('PCA_plot'))
                     )
             ),
            tabPanel("TSNE",
                     titlePanel("t-distributed stochastic neighbor embedding"),
                     sidebarLayout(
                         sidebarPanel(
                             selectInput("tsne_vars", "Choose one or more:", 
                                         choices = NULL, 
                                         multiple = TRUE),
                             selectInput('tsne_group', 'Categorical Variable:', 
                                         choices=NULL),
                             numericInput('seeds', 'Set Seed:', value=42),
                             checkboxInput("tsne_selectall","Select All", value=FALSE),
                             checkboxInput("tsne_unselectall", "Deselect", value=FALSE)
                             
                         ),
                         mainPanel(plotlyOutput('tsne_plot'))
                     ))
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

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    #' OUTPUT: DATA UPLOAD: produce table from inputted csv file
    output$contents <- renderTable({ data()})
    
    #' OUTPUT: Show data with columns of interest only
    #' ALLOWS saving the table as a csv file automatically.
    output$selectTable <- DT::renderDataTable({ selectData() })
    
    #' OUTPUT: render the UI for scatterplot
    output$MyPlot <- renderPlotly({ scatter() })
    
    #' OUTPUT: render the UI for categorical scatterplot
    output$catscatter <- renderPlotly({ catscat() })
    
    #' OUTPUT: render the UI for jitter plot
    output$jitterPlot <- renderPlotly({ jittering() })
    
    #' OUTPUT: render the UI for boxplot
    output$boxPlot <- renderPlotly({ bp() })
    
    #' OUTPUT: render the UI for histogram
    output$histPlot <- renderPlotly({ histogram_plot() })
    
    #' OUTPUT: render the UI for violin plots
    output$violinPlot <- renderPlotly({ violplot() })
    
    #' OUTPUT: render the UI for Correlational Plots
    output$CorPlot <- renderPlot({ correlation() })
    
    #' OUTPUT: render the UI for clustering
    output$kmeansPlot <- renderPlot({ clusterPlot() })
    
    #' OTUTPUT: render the UI for PCA 
    output$PCA_plot <- renderPlotly({ pcaPlot() })
    
    #' OUTPUT: render the UI for tsne
    output$tsne_plot <- renderPlotly({ tsnePlot() })
    
    #' OUTPUT: render the UI for lm() tab
    output$summary <- renderPrint({
        fit <- lm(data()[,input$yvar] ~ data()[,input$xvar])
        names(fit$coefficients) <- c("Intercept", input$xvar)
        summary(fit)
    })
    
    #' OUTPUT: render the UI for clustering
    output$HeatMap <- renderPlot({ hm() })
    
    #' OUTPUT: render the UI text for the linear regression
    output$slope <- renderPrint({
        paste(calc_lm()[1])
    })
    output$y_int <- renderPrint({
        paste(calc_lm()[2])
    })
    output$p_corr <- renderPrint({
        paste(calc_lm()[3])
    })
    
    # reading in the file
    data <- reactive({ 
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        # for the select column viewing
        updateSelectInput(session, "colchoice", label = "Columns of interest:", 
                          choices = names(df))
        # scatter
        updateSelectInput(session, inputId = 'xcol', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        # categorical scatter
        updateSelectInput(session, inputId = 'xcol_cat', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'ycol_cat', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId='group', label='Categorical Variable',
                          choices=names(df), selected=names(df))
        
        # jitter
        updateSelectInput(session, inputId = 'j_group', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'j_ycol', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        
        # boxplots
        updateSelectInput(session, inputId = 'box_group', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'boxcol', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        
        # histogram
        updateSelectInput(session, inputId = 'hist_x', label = 'X Variable',
                          choices = names(df), selected = names(df))
        
        # violin plot
        updateSelectInput(session, inputId = 'violin_group', label = 'X Variable',
                          choices = names(df), selected = names(df))
        updateSelectInput(session, inputId = 'violincol', label = 'Y Variable',
                          choices = names(df), selected = names(df))
        
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
    
    # data for select columns
    selectData <- reactive({
        chosen_cols <- DT::datatable(data()[,input$colchoice, drop=FALSE])
        return(chosen_cols)
    })
    
    selectData2 <- function(){
        chosen_cols <- data()[,input$colchoice]
        return(chosen_cols)
    }
    
    # calcuate the linear regression 
    calc_lm <- function(){
        result <- lm(data()[,input$ycol] ~ data()[,input$xcol])
        slope <- result[[1]][2]
        y_int <- result[[1]][1]
        p_corr <- cor(x=data()[,input$xcol], y=data()[,input$ycol], method="pearson")
        model <- c(slope, y_int, p_corr)
        model
    }
    
    #' Scatterplot function for the 2D: Scatterplot sub-tab
    #' allow for selection of colors for the scatterplots
    colorPoint <- reactive({c(input$col)})
    colorChange <- reactive({c(input$hcol)})
    
    scatter<- function(){
        this.plot <-  ggplot(data(), aes_string(x=input$xcol, y=input$ycol))+
            geom_point(aes(color=colorPoint()), size=1)+
            geom_smooth(method='lm', se=FALSE, size=0.7)+
            scale_color_manual(values=colorPoint())+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))+
            theme(legend.position = "none")
        
        return(this.plot)
    }
    
    #' Categorical Scatterplot function for the 2D: Categorical Scatter sub-tab
    catscat<- function(){
        this.plot <-  ggplot(data(),
                             aes_string(x=input$xcol_cat,
                                        y=input$ycol_cat,
                                        col=input$group, 
                                        shape=input$group))+
            geom_point(size=1)+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))

        return(this.plot)
    }
    
    #' Categorical Scatterplot function for the 2D: Categorical Scatter sub-tab
    jittering<- function(){
        this.plot <-  ggplot(data(),
                             aes_string(x=input$j_group,
                                        y=input$j_ycol,
                                        col=input$j_group))+
            geom_jitter(size=1)+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))
        
        return(this.plot)
    }
    
    #' Boxplot function for the 2D: Categorical Scatter sub-tab
    bp<- function(){
        this.plot <-  ggplot(data(),
                             aes_string(x=input$box_group,
                                        y=input$boxcol,
                                        fill=input$box_group))+
            geom_boxplot()+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))
        
        return(this.plot)
    }
    
    #' Histogram function for the 2D: Categorical Scatter sub-tab
    histogram_plot <- function(){
        this.plot <- ggplot(data(), aes_string(x=input$hist_x))+
            geom_histogram(alpha = 0.9, fill=colorChange(), col=colorChange())+
            scale_color_manual(values=colorChange())+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))
        
        return(this.plot)
    }
    
    #'Violin plot function for the 2D: Categorical Scatter sub-tab
    violplot<- function(){
        this.plot <-  ggplot(data(),
                             aes_string(x=input$violin_group,
                                        y=input$violincol,
                                        fill=input$violin_group))+
            geom_violin(alpha=0.8, trim=FALSE)+
            stat_summary(fun.data=mean_sdl, fun.args=list(mult=1), 
                         geom="pointrange")+
            theme_bw()+
            theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(), 
                  axis.line = element_line(colour = "black"))
        
        return(this.plot)
    }
    
    #' The dataset for x values chosen in correlational plots
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
    
    # the dataset for y values chosen for correlational plots
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
             pch = 20, cex = 2)
        points(clusters()$centers, pch = 4, cex = 2, lwd = 4)
    })
    
    # run pca for features
    run_pca_feats <- reactive({
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        if (input$pca_selectall==TRUE){
            updateSelectInput(session, "pca_vars", "Choose Columns:", choices=names(df),
                              selected=names(df))
        }
        else if(is.null(input$pca_vars)){
            updateSelectInput(session, "pca_vars", label="Choose Columns:", 
                              choices=names(df))
        }
        if(input$pca_unselectall==TRUE){
            updateCheckboxInput(session, "pca_selectall", label="Select All", 
                                value=FALSE)
            updateSelectInput(session, "pca_vars", label="Choose Columns", 
                              choices=names(df),
                              selected=NULL)
        }
        
        df <- select_if(df[,input$pca_vars], is.numeric)
        
        x <- prcomp(df)
        x2 <- data.frame(x$rotation)
        
        updateSelectInput(session, inputId='pcaN1', label='Choose Dimension 1:', 
                          choices=names(x2), selected=names(x2))
        
        updateSelectInput(session, inputId='pcaN2', label='Choose Dimension 2:', 
                          choices=names(x2), selected=names(x2))
        
        return(x2)
    })
    
    # reactive pca Color for individual pca
    pca_ind_df <- reactive({
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        updateSelectInput(session, inputId='pca_group',
                          label = 'PCA Group (Individual PCA only):',
                          choices=names(df), selected=names(df))
        
        return(df)
    })
    
    # run pca for individuals/subjects
    run_pca_ind <- reactive({
        # load in the data for pca with updated pca
        df <- pca_ind_df()
        
        if (input$pca_selectall==TRUE){
            updateSelectInput(session, "pca_vars", "Choose Columns:", choices=names(df),
                              selected=names(df))
        }
        else if(is.null(input$pca_vars)){
            updateSelectInput(session, "pca_vars", label="Choose Columns:", 
                              choices=names(df))
        }
        if(input$pca_unselectall==TRUE){
            updateCheckboxInput(session, "pca_selectall", label="Select All", 
                                value=FALSE)
            updateSelectInput(session, "pca_vars", label="Choose Columns", 
                              choices=names(df),
                              selected=NULL)
        }
        
        df2 <- select_if(df[,input$pca_vars], is.numeric)
        
        x <- prcomp(df2)
        x2 <- data.frame(x$x)
        x2$group <- df[,input$pca_group]
        
        updateSelectInput(session, inputId='pcaN1', label='Choose Dimension 1:', 
                          choices=names(x2), selected=names(x2))
        
        updateSelectInput(session, inputId='pcaN2', label='Choose Dimension 2:', 
                          choices=names(x2), selected=names(x2))
        
        updateSelectInput(session, inputId='pca_color', label='Individual PCA?',
                            choices=names(x2), selected=names(x2))
        
        return(x2)
    })
    
    #' for PCA plot purposes for features
    pcaPlot <- function(){
        # plot the features
        plot_feat <- function(){
            df <- run_pca_feats()
            p_features <- plot_ly(data=df,x=df[,input$pcaN1],
                                  y=df[,input$pcaN2],
                                  text=rownames(df),
                                  color = rownames(df),
                                  mode="markers",
                                  type='scatter')
            
            p_features <- layout(p_features,title="PCA of Features",
                                 xaxis=list(title=as.character(input$pcaN1)),
                                 yaxis=list(title=as.character(input$pcaN2)))
            
            return(p_features)
        }
        
        # plot the individuals
        plot_ind <- function(){
            df <- run_pca_ind()
            p_subjects <- plot_ly(data=df, x=df[,input$pcaN1], y=df[,input$pcaN2],
                                  text=df[,input$pca_color],
                                  mode='markers',
                                  color=df[,input$pca_color],
                                  type='scatter')
            
            p_subjects <- layout(p_subjects, title="PCA of Individuals",
                                 xaxis=list(title=as.character(input$pcaN1)),
                                 yaxis=list(title=as.character(input$pcaN2)))
            
            return(p_subjects)
        }
        # choosing which plot to do based on 
        pca_type <- switch(input$pca.type,
                           'PCA of Features' = plot_feat(), 
                           'PCA of Individuals' = plot_ind())
        
        return(pca_type)
    }
    
    #tsne data
    tsne_df <- reactive({
        req(input$file1)
        inFile <- input$file1
        
        df <- read.csv(inFile$datapath, header = input$header, sep = input$sep,
                       quote = input$quote)
        
        updateCheckboxInput(session, 'tsne_selectall', label="Select All")
        updateCheckboxInput(session, "tsne_unselectall", label="Deselect")
        
        if (input$tsne_selectall==TRUE){
            updateSelectInput(session, "tsne_vars", "Variables (Choose one or more):", 
                              choices=names(df),
                              selected=names(df))
        }
        else if(is.null(input$tsne_vars)){
            updateSelectInput(session, "tsne_vars", 
                              label="Variables (Choose one or more):", 
                              choices=names(df))
        }
        if(input$tsne_unselectall==TRUE){
            updateCheckboxInput(session, "tsne_selectall", label="Select All", 
                                value=FALSE)
            updateSelectInput(session, "tsne_vars", 
                              label="Variables (Choose one or more):", 
                              choices=names(df),
                              selected=NULL)
        }
        
        df_unique <- unique(df[,input$tsne_vars])
        
        updateSelectInput(session, "tsne_group", 'Categorical Variable:',
                          choices=names(df_unique), selected=names(df_unique))
        
        return(df_unique)
    })
    
    # tsne plot
    tsnePlot <- function(){
        df_unique <- tsne_df()
        
        labels <- df_unique[,input$tsne_group]
        
        df2 <- select_if(df_unique, is.numeric)
        
        # setting the seed
        set.seed(as.numeric(input$seeds))
        
        # run tsne
        tsne_out <- Rtsne(as.matrix(df2)) 
        
        # return the data we want from tsne
        tsne_df <- data.frame(tsne_out$Y)
        colnames(tsne_df) <- c('tsne-1', 'tsne-2')
        tsne_df$labels <- labels
        
        df <- tsne_df
        
        p <- plot_ly(df, x=df[,1],y=df[,2], 
                     text=df[,3],
                     mode="markers",
                     color=df[,3],
                     type='scatter')
        
        p <- layout(p,title="t-SNE",
                    xaxis=list(title="First Dimension"),
                    yaxis=list(title="Second Dimension"))
        
        return(p)
    }
    
    # heatmap function
    hm <- function(){
        dfmat <- dplyr::select_if(data(), is.numeric)
        dfmat <- as.matrix(scale(dfmat))
        x <- heatmap.2(dfmat,dendrogram='none', Rowv=TRUE, Colv=TRUE,trace='none')
        return(x)
    }
    
    #' download table of selected columns of interest
    output$downloadDataTable <- downloadHandler(
        filename = function() { paste(input$file1, '.csv', sep = '') },
        content = function(file) {write.csv(selectData2(), file)
    })
    
    # download scatterplot
    output$downloadPlot <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = scatter(), device = "png")
    })
    
    # download categorical scatterplot
    output$downloadCatScat <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = catscat(), device = "png")
    })
    
    # download jitter
    output$downloadjitter <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = jittering(), device = "png")
    })
    
    # download boxplot
    output$downloadjitter <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = bp(), device = "png")
    })
    
    # download histogram
    output$downloadjitter <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = histogram_plot(), device = "png")
    })
    
    # download violin plot
    output$downloadjitter <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = violplot(), device = "png")
        })
    
    # download correlation plot
    output$downloadCorPlot <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = correlation(), device = "png", height=8, units = "in")
        }) 
    
    # download heatmap
    output$downloadHM <- downloadHandler(
        filename = function() { paste(input$file1, '.png', sep='') },
        content = function(file) {
            ggsave(file, plot = hm(), device = "png", height=8, units = "in")
        }) 
}

# Run the application 
shinyApp(ui = ui, server = server)
