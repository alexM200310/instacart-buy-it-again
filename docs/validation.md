# Instacart SQL Validation Report

**Date:** November 27, 2026  
**Database:** PostgreSQL 16 — `instacart`  
**Validation tool:** DBeaver  
**Prepared by:** Patricia Ison

## 1. Purpose

Independently validate the Instacart product reorder analysis by executing SQL queries against the restored PostgreSQL dataset and comparing results with the team's preliminary findings.

## 2. Validation Results

| Validation check | Result |
|---|---:|
| Total products | 49,688 |
| Missing department products | 1,258 |
| Missing aisle products | 1,258 |
| Products with both missing labels | 1,258 |
| Missing aisle only | 0 |
| Missing department only | 0 |
| SQL 04: Eligible products (500+ purchases) | 8,266 |
| SQL 04: Average reorder rate | 53.08% |
| SQL 05: Eligible products (1,000+ purchases) | 5,050 |
| SQL 05: Average reorder rate | 55.35% |
| SQL 06: Top-ranked products | 20 |
| SQL 06: Dairy eggs products in top 20 | 14 |
| SQL 07: Products shared between top-20 rankings | 18 of 20 (90%) |
| SQL 08: Top-20 average reorder rate | 84.46% |
| SQL 09: Overall average reorder rate | 53.08% |
| SQL 09: Top-20 average reorder rate | 84.46% |
| SQL 09: Difference | 31.39 percentage points |

## 3. Key Findings

### Missing-data filters

All 1,258 products assigned to the missing aisle are also assigned to the missing department. Applying both exclusions removes no additional products compared with using either exclusion alone.

### Purchase threshold comparison

Increasing the minimum purchase threshold from 500 to 1,000 reduces the eligible product population from 8,266 to 5,050.

The average reorder rate increases from 53.08% to 55.35%.

### Top-20 ranking stability

The two top-20 rankings share 18 products, representing 90% overlap. This suggests that the leading products remain relatively stable under a stricter purchase threshold.

### Reorder rate comparison

The top 20 products have an average historical reorder rate of 84.46%, compared with 53.08% across all products meeting the 500-purchase threshold.

The calculated difference using unrounded rates is 31.39 percentage points.

## 4. Validation Method

- Restored the Instacart database using PostgreSQL 16 and DBeaver.
- Confirmed the restored schema and tables.
- Executed SQL queries against the local database.
- Compared numerical results with the team's preliminary findings.
- Checked product-filter overlap, purchase thresholds, ranking results, and average reorder rates.

## 5. Limitations and Pending Checks

- Results reflect the SQL queries executed locally. Exact correspondence with the original repository SQL files has not yet been independently confirmed.
- Top-20 department composition and ranking overlap were checked during the interactive validation session.
- The department-capped comparison remains pending coordination with Alex.
- Query outputs have not yet been exported into separate evidence files.

## 6. Conclusion

The executed SQL checks reproduced the team's preliminary numerical findings, including the product eligibility counts, reorder rates, ranking overlap, and top-20 comparison.

The validation provides additional support for the Instacart analysis, subject to the pending checks documented above.
