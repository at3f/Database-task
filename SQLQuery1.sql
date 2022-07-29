------------------------------------------------------------------------------------------------------------
-------------------------1. Which drink has the highest calories from the dataset ?-------------------------
------------------------------------------------------------------------------------------------------------
select Beverage , Beverage_prep
from drinkMenu
where Calories in (select Max(Calories)
from drinkMenu)


------------------------------------------------------------------------------------------------------------
-------------------------2. What is the average calorie amount for each drink category ?--------------------
------------------------------------------------------------------------------------------------------------
select Beverage_category as category, AVG(Calories) as averageCalories
from drinkMenu
group by Beverage_category


------------------------------------------------------------------------------------------------------------
-------------------------3. Which drinks have below average calorie amount ?--------------------------------
------------------------------------------------------------------------------------------------------------
select x.Beverage_category , x.Beverage, x.Calories
from drinkMenu x
where x.Calories < (select AVG(Calories)
					from drinkMenu
					where Beverage_category=x.Beverage_category)
