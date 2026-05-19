<div align="center">
<img width="634" height="357" alt="TechNet Logo 1" src="https://github.com/user-attachments/assets/d1cbfb3f-4791-418b-a003-2a03be8b5e4e" />
</div>

## Company Overview
TechNet is a global direct-to-consumer e-commerce company specializing in consumer electronics, including computers, mobile phones, and audio accessories. The company sells exclusively through its online platform across four regions, allowing full control over pricing, promotions, and customer engagement.

As a data analyst at TechNet, this analysis was conducted to help business stakeholders understand how sales performance and customer behaviour have evolved over time, particularly during and after the COVID-19 pandemic. By examining historical sales data from 2019 to 2022, the goal is to identify key opportunities to drive sustainable revenue growth in a post-pandemic market.

## Executive Summary
Based on sales, product, regional, and customer behaviour analysis, three key opportunities were identified

|Strategic Focus|Recommendation|
|---|---|
| Revenue Growth | <ul><li>Use targeted campaigns during perdictable seasonal dips to increase revenue from high-performing customer segments </li><li> Optimize product mix by prioritizing top-performing products (MacBook, AirPods, Gaming Monitor) and reassessing underperformers (Bose)</li><li> Increase investment in email marketing and use affiliate/direct channels to convert non-loyalty customers into loyalty members </li></ul> |
| Region Performance | <ul><li> Reallocate resources toward North America and APAC, which drive the majority of revenue and high-value purchases </li><li> Re-evaluate LATAM strategy as it has low revenue contribution (~6%) </li></ul> |
| Customer Profability | <ul><li> Increase customer lifetime value by continuing and optimizing the loyalty program </li><li> Protect revenue by reducing refunds, particularly for high-AOV products (ThinkPad, MacBook) </li></ul> |


### Data Structure
TechNet’s database contains 108,127 records across four relational tables; orders, customers, geo_lookup, and order_status. The data captures customer transactions, purchasing behavior, refund activity, and regional information hence enabling analysis across sales performance, customer retention, product trends, and geographic markets. The tables were joined to evaluate TechNet's business performance between 2019-2022. 

An Entity Relationship Diagram illustrating the database structure can be found [here](https://github.com/RagdaAA/E-commerce_analysis/blob/e30169d6fd7850898c5ece5ed84e47047e3a9341/Viz/ERD2.png).

---


## Insights Deep-Dive

### Revenue Growth: Product & Sales Trends 

|Sales Consistently Decline Between Q3–Q4 Across All Years, Revealing Predictable Seasonal Slowdowns|A Small Group of Products Drive Majority of TechNet’s Revenue|
|---|---|
|![Seasonal Decline every Q3](https://github.com/RagdaAA/E-commerce_analysis/blob/c47437fafe467e05567a22551966be373fa07ceb/graph_1%20v4.jpg)|![Few products behind majority of revenue](https://github.com/RagdaAA/E-commerce_analysis/blob/b694088ecd4f7d9cc770a4c1186665aed7cb94f8/Treemap2.jpg)|


#### Key insights
TechNet experienced a 162% surge in sales during 2020; however, by 2022, revenue, order volume, and average order value (AOV) all returned to pre-pandemic levels. This indicates that the growth was driven by short-term external demand rather than scalable, internal growth strategies.

Additionally, sales patterns show consistent seasonal declines between Q3–Q4 across all years, highlighting predictable periods of weakened demand that are not currently being mitigated.

From a product perspective, revenue is highly concentrated on a small subset of products; MacBook, AirPods, Gaming Monitor, and ThinkPad while others such as Bose Headphones and iPhone consistently underperform across sales and order volume.

#### Recommendation
To build a more resilient and scalable revenue model, TechNet should focus on two key levers:

<ul><li> Increase revenue from high-performing customer segments by deploying targeted marketing campaigns ahead of predictable seasonal dips (Q3–Q4). These can include time-bound promotions, personalized offers, and re-engagement campaigns to stabilize demand.</li>

<li>Optimize product mix to maximize sales performance by prioritizing high-performing products and reassessing underperforming ones. This may include reducing investment in low-performing products (e.g., Bose, iPhone) and reallocating resources toward products with proven demand and higher contribution to revenue.
</li></ul>

### Revenue Growth: Marketing Channel Performance

#### Key insights

Direct traffic consistently accounted for the majority of TechNet’s orders between 2019–2022, representing approximately 75–82% of total purchases. However, while Direct remained the dominant acquisition channel, order activity from non-loyalty customers steadily declined after the pandemic surge in 2020.

Email marketing showed stronger long-term growth compared to Affiliate and Social Media channels. Although order volume through Email peaked in 2021 and declined slightly in 2022, levels remained above pre-pandemic performance for both loyalty and non-loyalty customers, indicating sustained channel growth over time.

Customer behaviour also differed significantly by channel. Non-loyalty customers accounted for the majority of orders originating through Affiliate and Direct channels, whereas loyalty customers were slightly more likely to purchase through Email marketing. This suggests that Email campaigns are more effective at driving repeat engagement and retention behaviour.

Affiliate marketing showed the weakest long-term performance, with non-loyalty order volume declining below pre-pandemic levels by 2022.

#### Recommendation

<ul><li> To support more sustainable revenue growth, TechNet should increase investment in Email marketing as it has demonstrated stronger long-term performance and engagement compared to Affiliate and Social Media channels.</li>

<li>Additionally, Direct and Affiliate channels should be used more strategically to convert high-value non-loyalty customers into loyalty members through personalized offers, onboarding campaigns, and retention incentives. This would help strengthen customer retention and increase long-term customer value.
</li></ul>

### Market Efficiency: Regional Performance 

<div align="center">

|Revenue and High-value Purchases are driven by NA and APAC|
|---|
|<p style="text-align: center"><img src="https://github.com/RagdaAA/E-commerce_analysis/blob/091e3e4b83c68f04cdf0424c2f866f5b787573fe/Regional%20Performance.jpg"></p>|

</div>

#### Key insights
North America dominates TechNet’s performance, with the highest order volume and generating approximately 50% of total revenue. APAC records the highest AOV, followed by North America, suggesting stronger high-value purchasing behaviour in these two regions. LATAM underperforms significantly in all categories, contributing only around 6% of total revenue.

Sales trends over time show similar seasonal patterns across all regions, with no region overtaking another during peak periods, indicating shared global seasonality.

#### Recommendation

<ul><li>It is recommended to re-evaluate the current market strategy for LATAM, including distribution, marketing spend, and product-market fit, to determine whether adjustments or resource reallocation are warranted.</li></ul>


### Customer Strategy: Loyalty & Refunds 

|Loyalty Customers Became a Larger Driver of Revenue Growth After March 2021|
|---|
|![Revenue by loyalty vs non-loyalty customers](https://github.com/RagdaAA/E-commerce_analysis/blob/091e3e4b83c68f04cdf0424c2f866f5b787573fe/Loyalty%20program.jpg)|

<div align="center">
  
|Refunds Impact High-AOV Products|Over 50% of Refunds Originate in North America|
|---|---|
|![Refunds per product](https://github.com/RagdaAA/E-commerce_analysis/blob/091e3e4b83c68f04cdf0424c2f866f5b787573fe/Refund_rate%20product.jpg)|<p style="text-align: center"><img src="https://github.com/RagdaAA/E-commerce_analysis/blob/091e3e4b83c68f04cdf0424c2f866f5b787573fe/refund%20region.jpg"></p>|

</div>

#### Key insights
Customer behaviour analysis shows a clear shift from acquisition-driven growth during the 2020 surge to retention-driven performance in the following years. While non-loyalty customers drove the temporary spike in sales during 2020, loyalty customers have consistently outperformed since 2021 in both order volume and average order value (AOV), indicating stronger long-term value and engagement.

At the same time, refund patterns reveal a critical source of revenue leakage. Refund rates are disproportionately high for high-AOV products such as ThinkPad (~11.8%), MacBook (~11.4%), and iPhone (~7.6%), meaning that the most valuable transactions carry the highest risk of reversal. Additionally, North America accounts for over half of all refunds, suggesting region-specific drivers of returns.

#### Recommendation
To improve overall customer profitability, TechNet should focus on two key actions

<ul><li> Increase customer lifetime value through loyalty retention and expansion by maintaining the loyalty program and targeting high-value, non-loyalty customers for conversion. Additionally, re-engagement strategies should be implemented to address the decline in loyalty activity observed in late 2022. </li>

<li> Protect revenue by reducing refund rates on high-value products through targeted investigation into root causes, such as product quality issues, customer expectations, or fulfilment experience particularly within North America. </li></ul>




## Assumptions
