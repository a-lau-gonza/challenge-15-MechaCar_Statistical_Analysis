install.packages('dplry')
install.packages('dplyr', repos = 'https://cloud.r-project.org')
library(dplyr)

MechaCar_df = read.csv("MechaCar_mpg.csv", header=T,
                       colClasses = c("numeric", "numeric", "numeric", 
                                      "numeric", "numeric", "numeric"))

# Deliverable 1
final.fit1=lm(vehicle_length~vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,
              data=MechaCar_df)
summary(final.fit1)

# Deliverable 2
suspension_df <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F,
                          colClasses = c("character", "character", "numeric"))

total_summary <- suspension_df %>% summarize(Mean = mean(PSI),
                                             Median = median(PSI),
                                             Variance = var(PSI),
                                             SD = sqrt(var(PSI)))

lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),
                                                                           Median = median(PSI), 
                                                                           Variance = var(PSI), 
                                                                           SD = sqrt(var(PSI)), .groups = 'keep')

# Deliverable 3
