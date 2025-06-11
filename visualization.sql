/* Regional Performance Summary */
SELECT
  Region,
  AVG(Engagement_rate) AS avg_engagement,
  SUM(Total_users) AS total_users
FROM ga_regional_analysis
GROUP BY Region
ORDER BY total_users DESC;