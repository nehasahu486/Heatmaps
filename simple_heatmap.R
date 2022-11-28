library(gplots)

##Load the file with expression data (fpkm/rpkm/tpm) for which you want to create a heatmap
exp_data <- read.delim("fpkm.tsv", row.names = 1)

##Convert your data into a matrix, so gplots can process it
exp_matrix<- data.matrix(exp_data)

##check few lines of your matrix just to see if things look right
head(exp_matrix)

##select the color scheme
##this is for the most basic yet informative color scheme.. blue being lowest and red being the highest
mycols = colorRampPalette(c("blue","white","red"))(100) 

##set dendrogram clustering method
hr <- hclust(as.dist(1-cor(t(exp_matrix), method="pearson")), method="average") 

htmap <- heatmap.2(exp_matrix, Rowv= as.dendrogram(hr), dendrogram = "row", trace = "none",  
               col = mycols, keysize = 1, key.title = "Title", Colv = FALSE,
               scale = c("row"), cexRow = 0.75, cexCol = 1, srtCol = NULL,  
               srtRow = NULL, adjRow = c(0,NA), sepcolor="white" ,margins = c(7,15), 
                lwid = c(2,8),
               lhei= c(2,8), main ="Title", na.color="black") #this is the final one for the heat map

#you can change the red text to "column" or "both" for whichever dendrogram you require
##for long names in the y-axis then can change the margins

