PCOD Risk Predictor and Visual Dashboard

This repository provides a complete machine learning pipeline along with an insightful data visualization dashboard for predicting the **risk of PCOD (Polycystic Ovarian Disease)** using clinical and lifestyle parameters in **R**.

 The project combines:
- Data cleaning and preprocessing
- Exploratory data analysis (EDA)
- Correlation analysis
- Feature importance evaluation
- Machine Learning using Random Forest
- Visualizations (Histograms, Boxplots, Bar Charts, Correlation Matrix)
- Interactive prediction-ready structure (Shiny-compatible)

 Dataset

Source :https://www.kaggle.com/datasets/manasrai1406/menstrual-health-and-pcod-risk-detection-dataset
- **Key Features**:
  - Age, Height, Weight, BMI
  - Length of Menstrual Cycle
  - Menses Score, Bleeding Pattern
  - Estimated Ovulation Day
  - Lifestyle and Health Indicators

---

 Methods

### Data Preprocessing
- Removal of missing values
- BMI calculated from Height and Weight
- Categorical conversion for bleeding and unusual symptoms
Exploratory Data Analysis (EDA)
- **Age Distribution**: Histogram
- **BMI vs Unusual Bleeding**: Boxplot
- **PCOD Risk**: Bar chart
- **Feature Correlation**: Correlation matrix
 Machine Learning: Random Forest
- **Target Variable**: PCOD Risk (High / Low)
- **Model**: Random Forest Classifier
- **Validation**: 5-fold Cross-validation

 Results (Random Forest Classifier)

| Metric                | Value          |
|-----------------------|----------------|
| **Accuracy**          | 100%           |
| **95% CI**            | (89.11%, 100%) |
| **Kappa**             | 1.00           |
| **Sensitivity (Recall)** | 1.00        |
| **Specificity**       | 1.00           |
| **Precision (PPV)**   | 1.00           |
| **Balanced Accuracy** | 1.00           |
| **P-Value [Acc > NIR]** | 0.04285       |

**Confusion Matrix**:

|                    | Predicted High | Predicted Low |
|--------------------|----------------|---------------|
| **Actual High**    | 3              | 0             |
| **Actual Low**     | 0              | 29            |

**Interpretation**:
- The model achieved **perfect classification** on this test sample.
- Both high-risk and low-risk PCOD cases were **identified without error**.
- The high **Precision and Recall** values indicate strong potential for use in real-world early screening tools.

 Visuals Included

 Histogram: Age distribution  
 Boxplot: BMI vs Bleeding  
 Bar chart: PCOD risk frequency  
 Correlation matrix: Health features  
 Feature importance: via Gini index (Random Forest)

 How to Run

1. Open **RStudio**
2. Load `pcod_model.R` and `pcod.csv`
3. Run all code chunks sequentially

**Output Includes**:
- Cleaned dataset
- Visual analysis plots
- Trained Random Forest model
- PCOD risk predictions

 Unique Features

- Beginner-friendly R implementation
- Built-in preprocessing steps
- Fully modular and customizable
- Potential for health-tracking integration
- Early risk identification tool for women’s reproductive health


