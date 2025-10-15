# Variables in the final dataset:

Variable names are formed as follows:

1. time_ or freq_: 
  * Time variables represent the original data. 
  * Frequency (freq) variables represent a fast fourier transform of the time variable. (not done for all variables)
2. measure:
  * BodyAcc: body acceleration
  * GravityAcc: gravity acceleration
  * BodyAccJerk: body acceleration jerk (derivative in time of linear acceleration)
  * BodyGyro: body gyroscope signal
  * BodyGyroJerk: body gyroscope jerk (derivative in time of angular velocity)
  * BodyAccMag: magnitude of body acceleration, calculated using Euclidean norm
  * GravityAccMag: magnitude of gravity acceleration, calculated using Euclidean norm
  * BodyAccJerkMag: magnitude of body acceleration jerk, calculated using Euclidean norm
  * BodyGyroMag: magnitude of body gyroscope signal, calculated using Euclidean norm
  * BodyGyroJerkMag: magnitude of body gyroscope jerk, calculated using Euclidean norm
3. _mean or _std: mean or standard deviation
4. axis: _X, _Y, or _Z (where applicable)

For example, time_BodyAcc_mean_X is the mean time domain signal of body acceleration in the X axis.
freq_BodyGyroJerkMag_std is the standard deviation of the frequeny domain signal of body acceleration jerk magnitude.

Features are normalized and bounded withing [-1, 1].