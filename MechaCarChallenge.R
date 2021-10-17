install.packages('dplry')
install.packages('dplyr', repos = 'https://cloud.r-project.org')
library(dplyr)
MechaCar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
MechaCar_df <- read.csv('MechaCar_mpg.csv', header = TRUE)
model1 <- lm(mpg ~ vehicle_length + vehicle_weight, data = MechaCar_df)
summary(model1)
plot(x=vehicle_length, y=vehicle_weight)
# above did not work, testing other measures
MechaCar_df[1]
object1=MechaCar_df[1]
MechaCar_df[2]
object2=MechaCar_df[2]
MechaCar_df[3]
object3=MechaCar_df[3]
MechaCar_df[4]
object4=MechaCar_df[4]
MechaCar_df[5]
object5=MechaCar_df[5]
MechaCar_df[6]
object6=MechaCar_df[6]
# all columns in MechaCar_df are now objects
# testing plot again
plot(x=object1, y=object2)
# testing other lm models
lm(object1 ~ object2, MechaCar_df) # create linear model
# more testing
MechaCar_df = read.csv("MechaCar_mpg.csv", header=T,
                       colClasses = c("numeric", "numeric", "numeric", 
                                      "numeric", "numeric", "numeric"))
# all colums are now numeric in value
# simple fit test
simple.fit = lm(vehicle_length~vehicle_weight, data=MechaCar_df)
summary(simple.fit)
# success of simple.fit test 1
# multi.fit test 
multi.fit=lm(vehicle_length~vehicle_weight+mpg, data+MechaCar_df)
multi.fit=lm(vehicle_length~vehicle_weight+mpg, data=MechaCar_df)
summary(multi.fit)
# success of multi.fit test 1
# testing passing in more variables going from 3 to 4 
multi.fit2=lm(vehicle_length~vehicle_weight+spolder_angle+ground_clearance,
              data=MechaCar_df)
#misspell
multi.fit2=lm(vehicle_length~vehicle_weight+spoiler_angle+ground_clearance,
              data=MechaCar_df)
summary(multi.fit2)
#success of multi.fit 2
# passing in all 6 variables for linear regression model attempt 1
final.fit1(vehicle_length~vehicle_weight+spoiler_angle+ground_clearance+
             AWD+mpg, data=MechaCar_df)
# forgot an equals sign 
final.fit1=lm(vehicle_length~vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,
              data=MechaCar_df)
summary(final.fit1)


# Final Code for Deliverable 1
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
