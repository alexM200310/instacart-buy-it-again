# Instacart "Buy It Again": Which 20 Products Should We Remind Shoppers About?

**BAN 5003 Business Analytics & AI · Dr. Eric Bachura · UTSA · Fall 2026 Final Project**

Instacart's app has a small "Buy It Again" section that reminds shoppers to restock items.
This project ranks products by **how often people buy them again** and recommends the 20 to feature in a one-quarter pilot.

> **In one sentence:** we figured out which grocery items people buy over and over, so the app can remind them about the right ones.

---

## The question

| | |
|---|---|
| **Sponsor** | VP of Growth, Instacart (hypothetical) |
| **Decision** | Which 20 products to feature in "Buy It Again" for a one-quarter pilot |
| **Unit of analysis** | One product |
| **Population** | Products bought at least 500 times in customers' prior orders, excluding the `missing` department |
| **Success metric** | **Reorder rate** = share of a product's purchases flagged as a reorder (`AVG(reordered)` from `order_products__prior`) |
| **Method** | Descriptive ranking, compared with an alternative list capped at 2 products per department (reorder rate vs. variety), plus a stability check at a 1,000-purchase floor. No predictive model. |

## Results

> _Fill this in after running `src/analyze.py`. Copy the numbers from `outputs/findings.md`._

- The top 20 products are reordered **[X]%** of the time, vs. **[Y]%** for the average product.
- **[N] of 20** products stay in the list when the floor rises to 1,000 purchases.
- The pure top 20 is dominated by milk and half-and-half (**[14] of 20**). Capping the list at 2 products per department covers **[D]** departments and costs **[P]** percentage points of reorder rate.
- Recommendation: **[feature the pure top 20 / the capped list] in "Buy It Again" for a one-quarter pilot.**

---

## Repo layout

```
instacart-buy-it-again/
```
---

## How we use AI

We use **free-tier Claude** for a "second pair of eyes" for our findings and to help draft templates

All analysis, numbers and the recommendation are written by the team.

---

## Limitations

- The data is a 2017 public sample, so it shows past behavior, not what a reminder would cause. The pilot is how to measure real impact.
- There are no prices, so the anchor number is a reorder rate, not dollars.
- Ranking purely by reorder rate fills most of the list with milk and half-and-half, which would make the reminder repetitive. `top20_capped.csv` (max 2 per department) and `list_comparison.csv` show what variety costs in reorder rate, so the sponsor can choose knowingly. `top5_by_department.csv` gives more options per category.

---

## Team

| Member | Role |
|---|---|
| Maria Patricia Ison  | Project lead |
| Morgan Kelehar  | Data lead |
| Alejandro Mugica | Modeling lead |
| Anjali Sharma | Communications lead |
| Morgan Kelehar  | AI integration lead |

## Data source

Instacart, "The Instacart Online Grocery Shopping Dataset 2017," via the Kaggle competition *Instacart Market Basket Analysis*.
