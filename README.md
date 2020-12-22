# Classification-HR-analytics
Classification project on HR data of the data science job industry

## Context
A company which is active in Big Data and Data Science wants to hire data scientists among people who successfully pass some courses which conduct by the company. Many people signup for their trainings. Company wants to know which of these candidates are really wants to work for the company after training or looking for a new employment because it helps to reduce the cost and time as well as the quality of training or categorization of courses. Information related to demographics, education, experience are in hands from candidates signup and enrollment.
This dataset designed to understand the factors that lead a person will work for the company , by model(s) that uses the current credentials/demographics/experience to predict the probability of a candidate to look for a new job or will work for the company.
The whole data divided to train and test . Target isn't incuded in test but the answers exists for related tasks. I provided a sample submission corresponds to enrolleeid of test set too ( enrolleid | target)

## Goal
Predict the probability of a candidate will work for the company
Interpret models such a way that illustrate which features affects candidate decision

## Features
- enrollee_id : Unique ID for enrollee
- city: City code
- citydevelopmentindex: Developement index of the city (scaled)
- gender: Gender of enrolee
- relevent_experience: Relevent experience of enrolee
- enrolled_university: Type of University course enrolled if any
- education_level: Education level of enrolee
- major_discipline :Education major discipline of enrolee
- experience: Enrolee total experience in years
- company_size: No of employees in current employer's company
- company_type : Type of current employer
- lastnewjob: Difference in years between previous job and current job
- training_hours: training hours completed
- target: 0 – Not looking for job change, 1 – Looking for a job change

### Source
[HR data source](https://www.kaggle.com/arashnic/hr-analytics-job-change-of-data-scientists)
