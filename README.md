Streaming Engagement Analysis: Platform Retention & Content Strategy

Project Goal
The objective of this analysis was to move beyond raw logs and find actionable insights for a streaming platform. By connecting user tier data with viewing history, I focused on identifying high-engagement users, content popularity trends, and clear opportunities to drive premium upgrades.

Core Analysis & Logic

Mapping User Genre Preferences
I built a three-table join logic that traces individual viewing history back to specific movie content themes. This allows us to see exactly which genres drive the highest total watch volume for different user segments.

Targeting the Romance Super Users
Using strict aggregate filtering, I isolated heavy viewers within specific categories (like users watching more than 120 minutes of Romance). This reveals our most loyal audience pockets for targeted content recommendations.

Strategic Marketing & Upsell Classification
Using conditional CASE WHEN logic, I built a system that flags basic-tier accounts with high watch volume. This automatically separates standard users from high-value 'Upsell Candidates' who are ready for premium marketing campaigns.

Technical Skills Applied
- SQL Logic: Multi-table INNER JOIN operations, Conditional CASE WHEN statements.
- Aggregations: SUM calculations grouped across multiple non-aggregated columns.
- Advanced Filtering: Using WHERE for row-level filters and HAVING for aggregate thresholds.
