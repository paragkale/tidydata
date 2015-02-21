#Data Dictionary for 'Getting and Cleaning Data' Course Project


##Acknowledgements:

The tidy data set is a refinement of the data set mentioned in the following publication -

*[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
*

[www.smartlab.ws](www.smartlab.ws)

##Background Information About Initial Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities ***(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)*** wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###Each record in the initial data has the following:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A **561-feature vector** with time and frequency domain variables. 
- Its **activity label**. 
- An **identifier of the subject** who carried out the experiment.

###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

##Tidy(Transformed) Data

The following transformations were performed on the original data to create the tidy data as required by the project

###SubjectID
- Each row has the subject that performed the experiment
- Values range from 1 to 30

###ActivityType
- All activity types were mapped to 6 levels
- WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING

###Mean of Measured Variables
- Out of the 561 variables we select only 79 that have 'mean' or 'std' in their name (representing means or standard deviations respectively)
- The variable names have been formatted to be valid names in R; that is (, ), _ have been removed.

    1. tBodyAccmeanX
    2. tBodyAccmeanY
    3. tBodyAccmeanZ
    4. tBodyAccstdX
    5. tBodyAccstdY
    6. tBodyAccstdZ
    7. tGravityAccmeanX
    8. tGravityAccmeanY
    9. tGravityAccmeanZ
    10. tGravityAccstdX
    11. tGravityAccstdY
    12. tGravityAccstdZ
    13. tBodyAccJerkmeanX
    14. tBodyAccJerkmeanY
    15. tBodyAccJerkmeanZ
    16. tBodyAccJerkstdX
    17. tBodyAccJerkstdY
    18. tBodyAccJerkstdZ
    19. tBodyGyromeanX
    20. tBodyGyromeanY
    21. tBodyGyromeanZ
    22. tBodyGyrostdX
    23. tBodyGyrostdY
    24. tBodyGyrostdZ
    25. tBodyGyroJerkmeanX
    26. tBodyGyroJerkmeanY
    27. tBodyGyroJerkmeanZ
    28. tBodyGyroJerkstdX
    29. tBodyGyroJerkstdY
    30. tBodyGyroJerkstdZ
    31. tBodyAccMagmean
    32. tBodyAccMagstd
    33. tGravityAccMagmean
    34. tGravityAccMagstd
    35. tBodyAccJerkMagmean
    36. tBodyAccJerkMagstd
    37. tBodyGyroMagmean
    38. tBodyGyroMagstd
    39. tBodyGyroJerkMagmean
    40. tBodyGyroJerkMagstd
    41. fBodyAccmeanX
    42. fBodyAccmeanY
    43. fBodyAccmeanZ
    44. fBodyAccstdX
    45. fBodyAccstdY
    46. fBodyAccstdZ
    47. fBodyAccmeanFreqX
    48. fBodyAccmeanFreqY
    49. fBodyAccmeanFreqZ
    50. fBodyAccJerkmeanX
    51. fBodyAccJerkmeanY
    52. fBodyAccJerkmeanZ
    53. fBodyAccJerkstdX
    54. fBodyAccJerkstdY
    55. fBodyAccJerkstdZ
    56. fBodyAccJerkmeanFreqX
    57. fBodyAccJerkmeanFreqY
    58. fBodyAccJerkmeanFreqZ
    59. fBodyGyromeanX
    60. fBodyGyromeanY
    61. fBodyGyromeanZ
    62. fBodyGyrostdX
    63. fBodyGyrostdY
    64. fBodyGyrostdZ
    65. fBodyGyromeanFreqX
    66. fBodyGyromeanFreqY
    67. fBodyGyromeanFreqZ
    68. fBodyAccMagmean
    69. fBodyAccMagstd
    70. fBodyAccMagmeanFreq
    71. fBodyAccJerkMagmean
    72. fBodyAccJerkMagstd
    73. fBodyAccJerkMagmeanFreq
    74. fBodyGyroMagmean
    75. fBodyGyroMagstd
    76. fBodyGyroMagmeanFreq
    77. fBodyGyroJerkMagmean
    78. fBodyGyroJerkMagstd
    79. fBodyGyroJerkMagmeanFreq

**Each row has a SubjectID, an Activity Type and vector of 79 values that are the means of the 79 measurements for the SubjectID-Activity pair. Hence each variable is in one column, each row represents one observation and the entire table represents exactly one observational unit.**

##Note
For an in-dept understanding of the measurements, their units and interpretation, please refer the above mentioned publication
