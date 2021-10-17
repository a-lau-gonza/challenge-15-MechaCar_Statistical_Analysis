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
t.test(suspension_df$PSI, mu=1500)

# Using subset() apart from t.test()
lot1_df <- subset(suspension_df, Manufacturing_Lot == 'Lot1')
lot2_df <- subset(suspension_df, Manufacturing_Lot == 'Lot2')
lot3_df <- subset(suspension_df, Manufacturing_Lot == 'Lot3')

t.test(lot1_df$PSI, mu=1500)
t.test(lot2_df$PSI, mu=1500)
t.test(lot3_df$PSI, mu=1500)

# Attempting to use subset() within t.test() doesn't return different values despite my usage of subset()
# It must be related to the use of 'x', however I cannot find documentation about it online
t.test(x = suspension_df$PSI,
       subset = Manufacturing_Lot == 'Lot2',
       mu=1500)