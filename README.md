# Independent Study Project 
#### Author : Heejoon Ahn

Welcome to the dAbLication repository. This repository holds the tool that could be utilized for data visualization of various types for researchers in the aim to make it similar to GraphPad's Prism tool. The dAbLication requires less data loading as it only requires the user to load the data file of interest once and no copy and pasting! 

The following information in this particular README file is for a general summary of what each feature of the application does. For more specific information, please refer to the tutorials folder and look at the file explanation of interest. 

## Data Tab:

Currently within the Data tab of this application, there are two sub-tabs where the first is the very first step of using this tool, loading in the data file. The uploaded file must be in csv format, though the user can change some parameters of how the csv file gets loaded in. The second sub-tab is taking that loaded file and looking at specific columns of interest and potentially downloading that sub-data as a csv file into a local folder of the user's choice.

## 2D Plot Tab:

This tab allows the users to plot scatterplot, categorical scatterplot, jitter plot, boxplots, histograms, and violin plots. The plot types are separated by sub-tabs and the user can choose the variable of interest. The plots are generated using the help of plotly, and are interactive. There is a separate download button generated for the 2D Plots, so that the images could be saved in a slightly higher quality than plotly's automatic download settings, on a local folder. 

## Correlational Plot Tab:

This tab allows the users to generate a correlational plot that undergoes the "pearson" method. The user has options to choose which feature to plot. They also have the option to plot a scatterplot of the features to each other and save the correlational plot of interest.

## Heatmap Tab:

This tab allows the users to generate different types of heatmaps the users wish to plot. The variables of interest, like the correlational plot tab, can be chosen, along with a way to create a side color bar for categorical variables of interest. Future updates of interest is to make the heatmap interactive. There is also a download feature for the heatmap so the heatmap could be saved as an image file into a local folder.

## More Plots Tab:

This tab allows the users to do some clustering using k-means, PCA, and t-SNE. The k-means clustering plot sub-tab allows a numerical input for the number of clusters the user wishes to see after choosing the variables to plot. The PCA sub-tab allows users to plot PCA for features and another for individuals in the data file. The PCA plot is interactive, as it is generated with plotly. The t-SNE plot is also generated via plotly and is interactive as well. The user is allowed to set the seed to look at various types of the plot as they wish to.

Thank you for your support!
