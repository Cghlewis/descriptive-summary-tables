
# Descriptives for project documentation

# Step 1: Run the script for each time period in order (ex: 01_C1Y1T1.R, 02_C1Y1T2.R)
    # a) If you are on a new time period that has not been created, then 
      # 1. Open 01_C1Y1T1.R and change all instances of "C1Y1T1" to be the correct Cohort, Year, and Time Period
      # 2. Change the data import at the top of the student and teacher section to the correct data for the time period
      # 3. Save this syntax as 0#_C#Y#T#.R
      # 4. Then run this syntax as well as previous time periods

# Step 2: Merge all time periods by measure into tables to be exported using the 99_combine-all-measures.R file. 
    # a) First change the output file at the bottom of the script (update with current date)
    # b) Run 99_combine-all-measures.R
