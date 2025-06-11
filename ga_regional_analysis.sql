/*
Project: Regional Traffic Analysis for Healthcare Network
Dataset: Google Analytics 4 (GA4) data from BigQuery
Description: 
  - Classifies hospital pages into regions using URL patterns
  - Analyzes organic search traffic metrics
  - Outputs daily engagement metrics by region/hospital
*/

SELECT
  PARSE_DATE("%Y%m%d", Date) AS Day,
  Session_default_channel_group,
  Page_path_and_screen_class AS Link,
  CAST(Total_users AS INT64) AS Total_users,
  CAST(Engagement_rate AS FLOAT64) AS Engagement_rate,
  CAST(Sessions_per_user AS FLOAT64) AS Sessions_per_user,
  CAST(Average_session_duration AS FLOAT64) AS Average_session_duration,
  CAST(New_users AS INT64) AS New_users,
  
  -- Region classification using regex patterns
  CASE
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'al-ain-hospital|al-jowhara-hospital|al-madar|al-yahar|bawadi|zakher') THEN 'Al Ain'
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'airport-road-hospital|al-noor-hospital|al-mamora|al-mussafah|baniyas|khalifa-city|madinat-zayed|reem-mall-clinic') THEN 'Abu Dhabi'
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'city-hospital|City-Hospital-Comprehensive-Cancer-Centre|parkview-hospital|welcare-hospital|al-barsha-dialysis-centre|al-qusais|al-sufouh|al-tawar-dialysis-centre|arabian-ranches|creek-harbour|deira|dubai-hills|dubai-mall|ibn-battuta|me-aisem|meadows|mirdif|springs') THEN 'Dubai'
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'corporate') 
      AND NOT REGEXP_CONTAINS(Page_path_and_screen_class, r'(al-ain|abu dhabi|dubai)') 
      THEN 'Corporate'
    ELSE 'Other'
  END AS Region,

  -- Hospital classification
  CASE
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'al-ain-hospital') THEN 'Al Ain Hospital'
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'al-jowhara-hospital') THEN 'Al Jowhara Hospital'
    -- ... [other hospital mappings] ...
    WHEN REGEXP_CONTAINS(Page_path_and_screen_class, r'corporate') THEN 'Corporate Portal'
    ELSE 'Other'
  END AS Hospital

FROM `alkhwarizmimetric.my_dataset.google_analytics_table`
WHERE Session_default_channel_group = 'Organic Search';