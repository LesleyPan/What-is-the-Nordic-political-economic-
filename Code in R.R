library(FactoMineR)#For GDA
library(explor) #GUI for GDA
library(DescTools) #For Gini coefficients
library(cluster)
library(factoextra)
library(countrycode)
library(NbClust)

# 
# install.packages("devtools")
# devtools::install_github("WIDworld/wid-r-tool", force = TRUE)

getwd()
setwd("C:/Users/LiyuP/Desktop/CSS/Digital Strategies for Social Science/Final")
data <- read.csv("socialism.csv")

#remove country & population & scode
data[,1:2] <- NULL
rownames(data) <- data[,"scode"]
data[,which(colnames(data) == "scode")] <- NULL
#data[,grep("tax.supra.",colnames(data))] <- NULL
#data[is.na(data)] <- 0

#remove variables and observations containing too many NAs
data$delete_coun <- c(apply(is.na(data), 1, sum))
data <- data[-which(data[,"delete_coun"] > 100),]
data <- data[,-which(colnames(data) == "delete_coun")]

data <- rbind(data,delete_var = apply(is.na(data), 2, sum))
data <- data[,-which(data["delete_var",] > 10)]
data <- data[-which(rownames(data) == "delete_var"),]

#remove the low-level variables of reg.prof 
data <- data[,-grep("(?=^reg.prof)(?!.*reg$)",colnames(data),perl = TRUE)]

#remove the left other low-level variables
data <- data[,-grep("(?=(\\.).*(\\.).*(\\.))(?!.*reg)",colnames(data),perl = TRUE)]

#remove the data from SOCPROT dataset (duplicated with GOV2017)
data <- data[,-grep("^soc.",colnames(data))]

#remove the duplicated variable - exp.military.wdi
data <- data[,-grep("exp.military.wdi",colnames(data))]

#remove the summary variables
data <- data[,-grep("tot",colnames(data))]
data <- data[,-which(colnames(data) == "reg.ret.overall")]

#remove the tax.fed and tax.local
data <- data[,-grep("tax.fed|tax.local",colnames(data))]


#remove France (outlier)
# data_FR <- data[-which(rownames(data) == "FRN"),]
data <- data[,-which(colnames(data) == "polity2")]

colnames(data)

data_NA <- data
data <- data_NA

data <- as.data.frame(scale(data))

#data <- data_NA
data[is.na(data)] <- 0
#data <- data_NA



#K-means
km_res <- kmeans(data,5)
#km_res <- eclust(data,FUNcluster="kmeans", k=3,hc_metric = "euclidean")
table(names(km_res$cluster),km_res$cluster)
fviz_cluster(km_res, data, ggtheme=theme_classic())
## Evaluate the quality of clusering
fviz_silhouette(silhouette(km_res$cluster, dist(data)))
fviz_nbclust(scale(data), kmeans, method = c("silhouette"))
fviz_nbclust(scale(data), kmeans, method = c("gap"))

data$cluster <- as.factor(as.array(km_res$cluster))


# #PAM manhattan
# pam_res <- pam(scale(data), 5, metric = "euclidean", stand = T)
# #pam_res <- eclust(data,FUNcluster="pam", k=5,hc_metric = "euclidean")
# # table(names(pam_res$cluster),pam_res$cluster)
# fviz_cluster(pam_res, data, ggtheme=theme_classic())
# fviz_silhouette(pam_res, palette = "jco",
#                 ggtheme = theme_classic(), title="PAM")
# fviz_nbclust(scale(data), pam, method = c("silhouette"))
# 
# data$cluster_PAM <- as.factor(as.array(pam_res$cluster))
# 
# 
# 
# #Hierarchical Clustering
# #Create a distance matrix
# df <- dist(scale(data), method="euclidean") #Note the method, you could change it
# head(as.matrix(df))   #just FYI
# 
# 
# #Do it with 'ward.D2' and with 'complete'
# hc_res1 <- eclust(df, "hclust", k = 6, hc_metric = "euclidean", 
#                  hc_method = "ward.D2", graph = FALSE)
# 
# fviz_dend(hc_res1, cex = 0.5)
# 
# fviz_silhouette(hc_res1, palette = "jco",
#                 ggtheme = theme_classic(), 
#                 title="Hierarchical Clustering - Silhouettes Index")
# 
# #Choose optimal number of clusters
# fviz_nbclust(scale(data), hcut, method = c("silhouette"))
# 
# hc_res2 <- eclust(df, "hclust", k = 7
#                   , hc_metric = "euclidean", 
#                   hc_method = "ward.D2", graph = FALSE)
# 
# fviz_dend(hc_res2, cex = 0.5)
# 
# fviz_silhouette(hc_res2, palette = "jco",
#                 ggtheme = theme_classic(), title="hcut")
# 
# data$cluster <- as.factor(as.array(hc_res2$cluster))


#PCA
PCA_res<-PCA(data, scale.unit=T, quali.sup = 69)
str(PCA_res)
explor(PCA_res)
HCPC(PCA_res)$data.clust

aggregate(data[,1:68], by=list(km_res$cluster), mean)

table(hc_res2$cluster)

as.data.frame(scale(data[1:80]))
data1 <- read.csv("socialism.csv")
as.data.frame(scale(data_NA))
