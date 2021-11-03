# What-is-the-Nordic-political-economic?
## Code of a machine-learning-based study on Measuring Socialism Data Set

This study tries to provide some insights from statistics perspectives by investigating the empirical evidence to help answer the above question. On this purpose, a bunch of variables, covering the areas of government taxation, spending, organizational resources, regulations, and programs, is analyzed here by using the unsupervised machine learning approaches to capture the underlying relationship.

## Data Collection
The data is collected from the “Measuring Socialism Data Set, version 1.0.” data set built and released by Cohen, Joseph Nathan and Joseph van der Naald(Cohen n.d.) in 2019, which aims to capture some dimensions of countries’ conformity to socialist or capitalist ideals. The data in this data set compiled from several databases, such as The Organization for Economic Co-operation and Development’s and The World Bank’s, including country-level indicators and statistics data, and originally covering 41 countries and 243 variables from 2015 to 20171.

## Data Cleaning
Data cleaning was conducted firstly in my analysis. Some variables and observations, that containing too many missing values, have been removed. Besides, many low-level variables where most of them are fourth-level, the variables which are aggregations of other sub-level variables, and the duplicated variables, are all excluded to avoid the overlapping contribution and reduce the number of variables for clear interpretation. Thus, the data of 68 variables of 34 countries are finally selected, which measures public expenditures, public revenues, public savings and investments, economic regulations, and public sector workforce.

## Variables summary
All variables of public expenditures, public revenues, and public savings and investment are measured as the percentage of GDP. And the variables of economic regulations are not empirical and not definitive but have been standardized to a zero-to-six scale by conceptual model and agglomerative scheme to indicate the extent of the restriction of corresponding government-imposed rules, where the lower value means less restrictiveness. The 34 countries included in the analysis are Sweden, Finland, Norway, Denmark, Iceland, the United Kingdom, Ireland, the Netherlands, Belgium, Luxembourg, France, Switzerland, Spain, Portugal, Germany, Poland, Austria, Hungary, the Czech Republic, Slovakia, Slovenia, Italy, Greece, Estonia, Israel, Turkey, Korea, Japan, Australia, New Zealand, the United States, Canada, Mexico, and Chile.
