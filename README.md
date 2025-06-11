# Regional Healthcare Website Traffic Analysis

## Overview
This analysis classifies organic search traffic to hospital websites by geographic region and specific facility. It transforms raw GA4 data into actionable insights for regional marketing teams.

## Key Features
- Regional classification using URL patterns
- Hospital-level engagement metrics
- Organic search traffic filtering
- Daily performance tracking

## SQL Features Demonstrated
- Regular expressions for pattern matching
- Data type conversion
- Conditional logic with CASE statements
- Date parsing
- BigQuery-specific syntax

## How to Use
1. Replace `google_analytics_table` with your GA4 dataset
2. Adjust region/hospital regex patterns as needed
3. Run in BigQuery console
4. 
## Maintenance
- Regex patterns should be updated quarterly as URLs change
- Add new hospitals to region/hospital CASE statements
- Monitor GA4 schema changes
- 
## Sample Output
| Day       | Region     | Hospital          | Total_users | Engagement_rate |
|-----------|------------|-------------------|-------------|-----------------|
| 2023-05-01| Dubai      | City Hospital     | 150         | 0.45            |
| 2023-05-01| Al Ain     | Al Ain Hospital   | 87          | 0.62            |


graph LR
A[GA4 Raw Data] --> B[Region Classification]
B --> C[Dubai Hospitals]
B --> D[Abu Dhabi Hospitals]
B --> E[Al Ain Hospitals]
