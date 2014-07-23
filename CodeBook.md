---
title: "codebook.md"
date: "07/22/2014"
output: html_document
---

This codebook explains the data in the tidy_data.txt file which is produced by the run_analysis.R script that is located in the same repo as this codebook.  See also the README.md file located in the same repo.

The information about obtaining the data is explored thoroughly in the features_info.txt file available with the data set from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The purpose of this document is to explain the data output in the tidy_data.txt file from the run_analysis.R script.

The data in tidy_data.txt is sorted by activity_description and subject. There is one unique row for each combination of subject and activity.


#Columns:

1. "activity_description" 
    - Description of activity performed
        1. "LAYING"
        2. "SITTING"
        3. "STANDING"
        4. "WALKING"
        5. "WALKING_DOWNSTAIRS"
        6. "WALKING_UPSTAIRS"
2. "subject" 
    Index from 1-30 to indicate test subject
    
Following this are the mean values - for each subject performing each activity across all observations - for the means and standard deviations of all measurements made.  Data was normalized and bounded within [-1, 1].  Many data points are broken down into 3 demension - X, Y, and Z.

3. "tBodyAcc-mean()-X" 
4. "tBodyAcc-mean()-Y" 
5. "tBodyAcc-mean()-Z" 
6. "tBodyAcc-std()-X" 
7. "tBodyAcc-std()-Y" 
8. "tBodyAcc-std()-Z" 
9. "tGravityAcc-mean()-X" 
10. "tGravityAcc-mean()-Y" 
11. "tGravityAcc-mean()-Z" 
12. "GravityAcc-std()-X" 
13. "tGravityAcc-std()-Y" 
14. "tGravityAcc-std()-Z" 
15. "tBodyAccJerk-mean()-X" 
16. "tBodyAccJerk-mean()-Y" 
17. "tBodyAccJerk-mean()-Z" 
18. "tBodyAccJerk-std()-X" 
19. "tBodyAccJerk-std()-Y" 
20. "tBodyAccJerk-std()-Z" 
21. "tBodyGyro-mean()-X" 
22. "tBodyGyro-mean()-Y" 
23. "tBodyGyro-mean()-Z" 
24. "tBodyGyro-std()-X" 
25. "tBodyGyro-std()-Y" 
26. "tBodyGyro-std()-Z" 
27. "tBodyGyroJerk-mean()-X" 
28. "tBodyGyroJerk-mean()-Y" 
29. "tBodyGyroJerk-mean()-Z" 
30. "tBodyGyroJerk-std()-X" 
31. "tBodyGyroJerk-std()-Y" 
32. "tBodyGyroJerk-std()-Z" 
33. "tBodyAccMag-mean()" 
34. "tBodyAccMag-std()" 
35. "tGravityAccMag-mean()" 
36. "tGravityAccMag-std()" 
37. "tBodyAccJerkMag-mean()" 
38. "tBodyAccJerkMag-std()" 
39. "tBodyGyroMag-mean()" 
40. "tBodyGyroMag-std()" 
41. "tBodyGyroJerkMag-mean()" 
42. "tBodyGyroJerkMag-std()" 
43. "fBodyAcc-mean()-X" 
44. "fBodyAcc-mean()-Y" 
45. "fBodyAcc-mean()-Z" 
46. "fBodyAcc-std()-X" 
47. "fBodyAcc-std()-Y" 
48. "fBodyAcc-std()-Z" 
49. "fBodyAccJerk-mean()-X" 
50. "fBodyAccJerk-mean()-Y" 
51. "fBodyAccJerk-mean()-Z" 
52. "fBodyAccJerk-std()-X" 
53. "fBodyAccJerk-std()-Y" 
54. "fBodyAccJerk-std()-Z" 
55. "fBodyGyro-mean()-X" 
56. "fBodyGyro-mean()-Y" 
57. "fBodyGyro-mean()-Z" 
58. "fBodyGyro-std()-X" 
59. "fBodyGyro-std()-Y" 
60. "fBodyGyro-std()-Z" 
61. "fBodyAccMag-mean()" 
62. "fBodyAccMag-std()" 
63. "fBodyBodyAccJerkMag-mean()" 
64. "fBodyBodyAccJerkMag-std()" 
65. "fBodyBodyGyroMag-mean()" 
66. "fBodyBodyGyroMag-std()" 
67. "fBodyBodyGyroJerkMag-mean()" 
68. "fBodyBodyGyroJerkMag-std()"