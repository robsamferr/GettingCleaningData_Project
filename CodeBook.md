VARIABLES

•	t_xtrain: gets data from X_train.txt
•	t_ytrain: gets data from y_train.txt
•	t_xtest: gets data from X_train.txt
•	t_ytest: gets data from y_test.txt
•	sub_train: gets data from subject_train.txt
•	sub_test: gets data from subject_test.txt
•	x: merges data from t_xtrain and t_ytrain
•	y: merges data from t_xtest and t_ytest
•	sub: merges data from sub_train and sub_test
•	features: gets data from features.txt
•	mean_std: gets records from features where they end in -mean or -std
•	xys: merges all data from x, y and sub tables
•	avg_data: gets all data merged inside xys with their column names

PROCEDURE

run_analysis.R file do the following the steps:
1. Reads the data from train, test an subject files and merges it in three tables using rbind() function.
2. Extracts the column names from features.txt and rename the columns from x merged table with them.
3. Labels the columns from act (activities) and sub (subjects) tables as "ACTIVITY" and "SUBJECT" respectively.
4. Labels all columns in xys merged table, which contains all data from x, y and sub tables.
5. Finally, writes the result table in a file called averages_data.txt.
