
## Tidy Dataset preparation from the Human Activity Recognition Using Smartphones Dataset

The original dataset contains accelorometer and gyroscope values of 30 volunteers while performing 6 different activities. The data has been further split into Training and Test data.

In this data cleaning activity, the data from the original dataset has been processed by the following steps :

- Only those columns which contain Mean or Std (Standard Deviation) are used.

- Training Data is prepared by combining the Subject identifiers from the subject_train.txt file, Activity id from the Y-train.txt and the values for each measurement from the X-train.txt

- Same is repeated for the Test data.Test Data is prepared by combining the Subject identifiers from the subject_test.txt file, Activity id from the Y-test.txt and the values for each measurement from the X-test.txt.

- Training and Test Datasets are combined to form one continuous dataset.

- Activity ids in the Activity column are replaced by the Activity Description from activity_labels.txt.

- A new Tidy Dataset is created by grouping the above dataset by Subject and Activity and calculating the mean of the remaining columns.

- Columns names are modified by prefixing "Mean" to indicate that the values shown in the columns are the mean values for the subject for each activity.

### For each record it is provided:
- Mean of Triaxial acceleration from the accelerometer mean and Standard Deviation
- Mean of the Triaxial Angular velocity from the gyroscope mean and Standard Deviation. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:
- 'README.Rmd'
- 'run_analysis.R' : R script which was used to modify the original dataset to create the Tidy Data.
- 'Codebook.Rmd' : List of all variables in the Tidy Dataset and their description
- 'TidyData.txt' : Data in text format separated by " " with headers.

### Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
