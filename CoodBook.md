## Codebook
Description of variables in ~~tidy_data_set_created_in_step_5.txt~~

### Raw Data
Below is quote from original source (www.smartlab.ws) and their REAME.md file
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

And, another quote from original source's features_info.txt
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From these raw data sets, the ~~run_analysis.R~~ and its resulting text file ~~tidy_data_set_created_in_step_5.txt~~ took only the variables for mean and standard deviation, and calculate the average of each variable grouped by activity and subject.


### Tidy Data Variable Description
*tidy_data_set_created_in_step_5.txt* consist of 69 variables and 180 observations.
Each variable contains following info: 

##### id Variables
First three columns contain variables with identification. 

**Variable 1.**  *activity_name*
contains six activities : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**Variable 2.**  *subject*
contains identification number of 30 participants of the experiment. 

**Variable 3.** *activity*
contains labeling number of *activity_name*
|activity_name|activity|
|--------------|----------|
|WALKING|1|
|WALKING_UPSTAIRS|2|
|WALKING_DOWNSTAIRS|3|
|SITTING|4|
|STANDING|5|
|LAYING|6|
---------------------------
 
**Variable 4 through 69**
contain calculated average (from the raw data sets) of each variable grouped by activity and subject.
The list are as follow:

Column(Variable) No. | Variable Name | Unit
---------------------------------------------------------------------------
4 | mean_of_time_signal_of_BodyAcc_on_X_axis | Acceleration
5 | mean_of_time_signal_of_BodyAcc_on_Y_axis | Acceleration
6 | mean_of_time_signal_of_BodyAcc_on_Z_axis | Acceleration
7 | standard_deviation_of_time_signal_of_BodyAcc_on_X_axis | Acceleration
8 | standard_deviation_of_time_signal_of_BodyAcc_on_Y_axis | Acceleration
9 | standard_deviation_of_time_signal_of_BodyAcc_on_Z_axis | Acceleration
10 | mean_of_time_signal_of_GravityAcc_on_X_axis | Acceleration
11 | mean_of_time_signal_of_GravityAcc_on_Y_axis | Acceleration
12 | mean_of_time_signal_of_GravityAcc_on_Z_axis | Acceleration
13 | standard_deviation_of_time_signal_of_GravityAcc_on_X_axis | Acceleration
14 | standard_deviation_of_time_signal_of_GravityAcc_on_Y_axis | Acceleration
15 | standard_deviation_of_time_signal_of_GravityAcc_on_Z_axis | Acceleration
16 | mean_of_time_signal_of_BodyAccJerk_on_X_axis | Jerk
17 | mean_of_time_signal_of_BodyAccJerk_on_Y_axis | Jerk
18 | mean_of_time_signal_of_BodyAccJerk_on_Z_axis | Jerk
19 | standard_deviation_of_time_signal_of_BodyAccJerk_on_X_axis | Jerk
20 | standard_deviation_of_time_signal_of_BodyAccJerk_on_Y_axis | Jerk
21 | standard_deviation_of_time_signal_of_BodyAccJerk_on_Z_axis | Jerk
22 | mean_of_time_signal_of_BodyGyro_on_X_axis | Velocity
23 | mean_of_time_signal_of_BodyGyro_on_Y_axis | Velocity
24 | mean_of_time_signal_of_BodyGyro_on_Z_axis | Velocity
25 | standard_deviation_of_time_signal_of_BodyGyro_on_X_axis | Velocity
26 | standard_deviation_of_time_signal_of_BodyGyro_on_Y_axis | Velocity
27 | standard_deviation_of_time_signal_of_BodyGyro_on_Z_axis | Velocity
28 | mean_of_time_signal_of_BodyGyroJerk_on_X_axis | Jerk
29 | mean_of_time_signal_of_BodyGyroJerk_on_Y_axis | Jerk
30 | mean_of_time_signal_of_BodyGyroJerk_on_Z_axis | Jerk
31 | standard_deviation_of_time_signal_of_BodyGyroJerk_on_X_axis | Jerk
32 | standard_deviation_of_time_signal_of_BodyGyroJerk_on_Y_axis | Jerk
33 | standard_deviation_of_time_signal_of_BodyGyroJerk_on_Z_axis | Jerk
34 | mean_of_time_signal_of_BodyAccMag | Magnitude
35 | standard_deviation_of_time_signal_of_BodyAccMag | Magnitude
36 | mean_of_time_signal_of_GravityAccMag | Magnitude
37 | standard_deviation_of_time_signal_of_GravityAccMag | Magnitude
38 | mean_of_time_signal_of_BodyAccJerkMag | Magnitude
39 | standard_deviation_of_time_signal_of_BodyAccJerkMag | Magnitude
40 | mean_of_time_signal_of_BodyGyroMag | Magnitude
41 | standard_deviation_of_time_signal_of_BodyGyroMag | Magnitude
42 | mean_of_time_signal_of_BodyGyroJerkMag | Magnitude
43 | standard_deviation_of_time_signal_of_BodyGyroJerkMag | Magnitude
44 | mean_of_frequency_signal_of_BodyAcc_on_X_axis | Acceleration
45 | mean_of_frequency_signal_of_BodyAcc_on_Y_axis | Acceleration
46 | mean_of_frequency_signal_of_BodyAcc_on_Z_axis | Acceleration
47 | standard_deviation_of_frequency_signal_of_BodyAcc_on_X_axis | Acceleration
48 | standard_deviation_of_frequency_signal_of_BodyAcc_on_Y_axis | Acceleration
49 | standard_deviation_of_frequency_signal_of_BodyAcc_on_Z_axis | Acceleration
50 | mean_of_frequency_signal_of_BodyAccJerk_on_X_axis | Jerk
51 | mean_of_frequency_signal_of_BodyAccJerk_on_Y_axis | Jerk
52 | mean_of_frequency_signal_of_BodyAccJerk_on_Z_axis | Jerk
53 | standard_deviation_of_frequency_signal_of_BodyAccJerk_on_X_axis | Jerk
54 | standard_deviation_of_frequency_signal_of_BodyAccJerk_on_Y_axis | Jerk
55 | standard_deviation_of_frequency_signal_of_BodyAccJerk_on_Z_axis | Jerk
56 | mean_of_frequency_signal_of_BodyGyro_on_X_axis | Velocity
57 | mean_of_frequency_signal_of_BodyGyro_on_Y_axis | Velocity
58 | mean_of_frequency_signal_of_BodyGyro_on_Z_axis | Velocity
59 | standard_deviation_of_frequency_signal_of_BodyGyro_on_X_axis | Velocity
60 | standard_deviation_of_frequency_signal_of_BodyGyro_on_Y_axis | Velocity
61 | standard_deviation_of_frequency_signal_of_BodyGyro_on_Z_axis | Velocity
62 | mean_of_frequency_signal_of_BodyAccMag | Magnitude
63 | standard_deviation_of_frequency_signal_of_BodyAccMag | Magnitude
64 | mean_of_frequency_signal_of_BodyBodyAccJerkMag | Magnitude
65 | standard_deviation_of_frequency_signal_of_BodyBodyAccJerkMag | Magnitude
66 | mean_of_frequency_signal_of_BodyBodyGyroMag | Magnitude
67 | standard_deviation_of_frequency_signal_of_BodyBodyGyroMag | Magnitude
68 | mean_of_frequency_signal_of_BodyBodyGyroJerkMag | Magnitude
69 | standard_deviation_of_frequency_signal_of_BodyBodyGyroJerkMag | Magnitude





