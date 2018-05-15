Root mean squared log error -- to evaluate error based on percentage of error

Random Forest
Categorical or continuous
doesn't overfit
don't need separate validation separate
few if any statistical assumptions (normally distributed, linear relationships)
doesn't require feature engineering


Curse of Dimensionality
The more dimensions you have the more all points sit on the edge of that space.
The distance between points is much less meaningful.

No Free Lunch Theorem
No type of model that works well for any kind of dataset.
In the real world we look at data that isn't totally random -- there are techniques that work better for all datasets than others. 

"Largely meaningless and basically stupid."


Regression - a machine learning model that's trying to predict continuous variable
Classification - predict categorical variable

Feature Engineering for Date
Year
Month
Quarter
DayOfMonth
DayOfWeek
WeekOfYear
IsHoliday
IsWeekend
WasRaining
SportsEventOccurred

Depends on what we're predicting -- whether the Celtics were playing that day might be important and it might not -- depends on the context.

Add columns whenever you can -- there's almost no harm in doing so.