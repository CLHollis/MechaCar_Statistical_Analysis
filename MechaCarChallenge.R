
# Deliverable 1: Linear Regression to Predict MPG

# Load the dplyr package
library(tidyverse)

# Import and read in the MechaCar_mpg.csv file as a dataframe
MechaCar_mpg <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

# Perform linear regression, pass in all six variables, add the df you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)

# Determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))

#--------------------------------------------

# Deliverable 2: Summary Statistics on Suspension Coils

# Import and read in the Suspension_Coil.csv file as a table
suspension_coil <- read.csv('suspension_coil.csv',check.names = F,stringsAsFactors = F)

# Create a total_summary df to get the mean, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Create a lot_summary df to group each manufacturing lot by those ^ stats.
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')

#--------------------------------------------

# Deliverable 3: T-Test on Suspension Coils

# Use a t-Test to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 PSI
# Create a sample
sample_susp_coil <- suspension_coil %>% sample_n(15) 
t.test(suspension_coil$PSI, mu=1500)
t.test(sample_susp_coil$PSI, mu=1500)

# Write three more t-Tests using the subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 PSI
# Create seperat lot datasets
lot1 <- suspension_coil %>% filter(Manufacturing_Lot=="Lot1")
lot2 <- suspension_coil %>% filter(Manufacturing_Lot=="Lot2") 
lot3 <- suspension_coil %>% filter(Manufacturing_Lot=="Lot3")
# Create the t-Tests for each lot
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)







