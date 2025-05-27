# Heart Failure Indicators

This dataset contains the medical records of 299 patients who had heart failure, collected during their follow-up period, where each patient profile has 13 clinical features.

Thirteen (13) clinical features:

- age: age of the patient (years) </br>
- anaemia: decrease of red blood cells or hemoglobin (boolean) </br>
- creatinine phosphokinase  (CPK): level of the CPK enzyme in the blood (mcg/L) </br>
- diabetes: if the patient has diabetes (boolean) </br>
- ejection fraction: percentage of blood leaving the heart at each contraction  (percentage) </br>
- high blood pressure: if the patient has hypertension (boolean) </br>
- platelets: platelets in the blood (kiloplatelets/mL) </br>
- sex: woman or man (binary) </br>
- serum creatinine: level of serum creatinine in the blood (mg/dL) </br>
- serum sodium: level of serum sodium in the blood (mEq/L) </br>
- smoking: if the patient smokes or not (boolean) </br>
- time: follow-up period (days) </br>
- [target] death event: if the patient died during the follow-up period (boolean) </br>

--- 
Data Cleaning - The following code is used to clean the data and ensure:
---
<ul> 
 <li> No rows are duplicated </li>
<li> Data is sorted from lowest year to highest</li>
</ul>
---  </br>
heartfailure_data <- read.csv(file.choose())

#throwing a function to give a climpse of the data </br>
glimpse(heartfailure_data)

#summary of data </br>
skim_without_charts(heartfailure_data)

#accessing the first few rows of the data </br>
head(heartfailure_data)

#sorting the data from the lowest year to highest </br>
heartfailure_data %>% arrange(YEAR..DISPLAY.)

#ensuring to remove any dupliate data </br>
heartfailure_data <- heartfailure_data[!duplicated(heartfailure_data)] 

--- 

---
Data Visualization (Diabetes Vs Death Event and High Blood Pressure Vs Death Event)
---

---

heartfailure_data$diabetes <- as.factor(heartfailure_data$diabetes) </br>
heartfailure_data$DEATH_EVENT <- as.factor(heartfailure_data$DEATH_EVENT)

#Plot anaemia vs death event
ggplot(heartfailure_data, aes(x = diabetes, fill = DEATH_EVENT)) + </br> 
  geom_bar(position = "dodge") + </br>
  labs(title = "Diabetes vs Death Event", </br>
       x = "Diabetes (0 = No, 1 = Yes)", </br>
       y = "Count", </br>
       fill = "Death Event") + </br>
  theme_minimal() </br>

heartfailure_data$high_blood_pressure <- as.factor(heartfailure_data$high_blood_pressure) </br>
heartfailure_data$DEATH_EVENT <- as.factor(heartfailure_data$DEATH_EVENT)

ggplot(heartfailure_data, aes(x = high_blood_pressure, fill = DEATH_EVENT)) + </br>
  geom_bar(position = "dodge") + </br>
  labs(title = "High Blood Pressure vs Death Event", </br>
       x = "Diabetes (0 = No, 1 = Yes)", </br>
       y = "Count", </br>
       fill = "Death Event") + </br>
  theme_minimal()

---
