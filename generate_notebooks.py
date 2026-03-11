"""
generate_notebooks.py
─────────────────────
Generates Jupyter notebooks (.ipynb) for ECON4002 weeks 1–12 from
the *_code_snippets.json files. Includes test cases for Nomad app
notebook viewer: text output, HTML table, PNG image, LaTeX math,
and an empty code cell.

Run: python3 generate_notebooks.py
"""

import json
import os
import base64
import io

# ─── Generate a sample supply/demand PNG ──────────────────────────────────────
def make_plot_png_b64(week: int, title: str) -> str:
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import numpy as np

    fig, ax = plt.subplots(figsize=(5, 3.5))
    x = np.linspace(0, 100, 200)
    ax.plot(x, 200 - 2 * x, "b-", linewidth=2, label="Demand")
    ax.plot(x, 20 + 1.5 * x, "r-", linewidth=2, label="Supply")
    ax.axvline(x=72.7, color="gray", linestyle="--", linewidth=1)
    ax.axhline(y=54.5, color="gray", linestyle="--", linewidth=1)
    ax.scatter([72.7], [54.5], color="black", zorder=5, s=60)
    ax.set_xlim(0, 110)
    ax.set_ylim(0, 220)
    ax.set_xlabel("Quantity")
    ax.set_ylabel("Price ($)")
    ax.set_title(f"Week {week}: {title}")
    ax.legend(loc="upper right")
    ax.grid(True, alpha=0.3)
    buf = io.BytesIO()
    plt.savefig(buf, format="png", dpi=90, bbox_inches="tight")
    plt.close()
    buf.seek(0)
    return base64.b64encode(buf.read()).decode("utf-8")


# ─── LaTeX intro formulas by week ─────────────────────────────────────────────
WEEK_MATH = {
    1:  r"Market equilibrium: $Q_d(P^*) = Q_s(P^*)$. Price elasticity: $\varepsilon = \frac{dQ}{dP} \cdot \frac{P}{Q}$",
    2:  r"Exponential growth: $Q(t) = Q_0 e^{rt}$. Logarithm: $\ln(e^x) = x$",
    3:  r"Numerical derivative: $f'(x) \approx \frac{f(x+h) - f(x-h)}{2h}$. Cobb-Douglas: $Q = AL^{\alpha}K^{\beta}$",
    4:  r"First-order condition: $\frac{d\pi}{dq} = 0$. Lagrangian: $\mathcal{L} = f(x,y) - \lambda(g(x,y) - c)$",
    5:  r"Utility maximisation: $\max U(x_1, x_2)$ s.t. $p_1 x_1 + p_2 x_2 = m$. MRS: $\frac{MU_1}{MU_2} = \frac{p_1}{p_2}$",
    6:  r"Expenditure minimisation: $\min p_1 x_1 + p_2 x_2$ s.t. $U(x_1,x_2) \geq \bar{U}$",
    7:  r"Profit maximisation: $\max \pi = pf(L,K) - wL - rK$. Isoquant: $f(L,K) = \bar{Q}$",
    8:  r"Cost function: $C(q) = wL^*(q) + rK^*(q)$. MC: $\frac{dC}{dq}$. AC: $\frac{C(q)}{q}$",
    9:  r"Competitive equilibrium: $P = MC$. CS $= \int_0^{Q^*}[D(q) - P^*]\,dq$",
    10: r"Trade gains: $\Delta W = \Delta CS + \Delta PS$. Tariff DWL $= \frac{1}{2}(P_T - P_W)(Q_2 - Q_1 + Q_4 - Q_3)$",
    11: r"Social welfare: $W = CS + PS - \text{externality cost}$. Pigouvian tax: $t^* = \text{MEC at optimum}$",
    12: r"Expected utility: $EU = \sum_i p_i u(v_i)$. Risk premium: $u(EV - \rho) = EU$",
}

# ─── HTML table for a data frame (pre-baked viewer test) ──────────────────────
SAMPLE_HTML_TABLE = """<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th><th>crop</th><th>yield</th><th>price</th><th>revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr><th>0</th><td>wheat</td><td>45</td><td>7.50</td><td>337.50</td></tr>
    <tr><th>1</th><td>corn</td><td>180</td><td>4.50</td><td>810.00</td></tr>
    <tr><th>2</th><td>soybean</td><td>50</td><td>13.00</td><td>650.00</td></tr>
  </tbody>
</table>
</div>"""


# ─── Notebook helpers ──────────────────────────────────────────────────────────
def md_cell(source: str) -> dict:
    return {
        "cell_type": "markdown",
        "metadata": {},
        "source": source,
    }


def code_cell(source: str, outputs: list = None) -> dict:
    return {
        "cell_type": "code",
        "execution_count": None,
        "metadata": {},
        "source": source,
        "outputs": outputs or [],
    }


def text_output(text: str) -> dict:
    return {
        "output_type": "stream",
        "name": "stdout",
        "text": text,
    }


def html_output(html: str) -> dict:
    return {
        "output_type": "display_data",
        "metadata": {},
        "data": {
            "text/html": html,
            "text/plain": "[DataFrame]",
        },
    }


def image_output(b64_png: str) -> dict:
    return {
        "output_type": "display_data",
        "metadata": {},
        "data": {
            "image/png": b64_png,
            "text/plain": "[Plot]",
        },
    }


# ─── Build one notebook ────────────────────────────────────────────────────────
def build_notebook(snippets_path: str) -> dict:
    with open(snippets_path) as f:
        data = json.load(f)

    week  = data["week"]
    title = data["title"]
    desc  = data.get("description", "")
    snips = data.get("snippets", [])

    cells = []

    # ── Title / intro markdown cell ───────────────────────────────────────────
    math_line = WEEK_MATH.get(week, "")
    cells.append(md_cell(
        f"# ECON4002 — Week {week}: {title}\n\n"
        f"**University of Western Australia**  \n"
        f"*{desc}*\n\n"
        "---\n\n"
        "## Key Formulae\n\n"
        f"{math_line}\n\n"
        "---\n\n"
        "> **How to use:** Run each cell in order. "
        "Modify the parameters and re-run to explore the economics."
    ))

    # ── Setup cell with pre-baked text output ─────────────────────────────────
    setup_code = (
        "# ECON4002 Week " + str(week) + " — R Setup\n"
        "# Run this cell first to configure options\n"
        "options(scipen = 6, digits = 4)\n"
        "cat('Week " + str(week) + ": " + title + " — ready!\\n')"
    )
    cells.append(code_cell(
        setup_code,
        [text_output(f"Week {week}: {title} — ready!\n")]
    ))

    # ── Group snippets by category ────────────────────────────────────────────
    categories = {}
    for s in snips:
        cat = s.get("category", "general")
        categories.setdefault(cat, []).append(s)

    for cat, cat_snips in categories.items():
        # Category header
        cells.append(md_cell(f"## {cat.replace('_', ' ').title()}"))

        for s in cat_snips:
            sid   = s.get("id", "")
            stitle = s.get("title", "")
            sdesc  = s.get("description", "")
            scode  = s.get("code", "")
            snotes = s.get("notes", "")
            secon  = s.get("economic_interpretation", "")
            serrs  = s.get("common_errors", [])

            # Snippet markdown cell
            md_parts = [f"### {sid} — {stitle}"]
            if sdesc:
                md_parts.append(f"\n{sdesc}")
            if snotes:
                md_parts.append(f"\n> **Note:** {snotes}")
            if secon:
                md_parts.append(f"\n> **Interpretation:** {secon}")
            if serrs:
                md_parts.append("\n**Common errors:**")
                for e in serrs:
                    md_parts.append(f"- {e}")
            cells.append(md_cell("\n".join(md_parts)))

            # Code cell (no pre-baked outputs — students run them)
            cells.append(code_cell(scode))

    # ── Special viewer test cells ─────────────────────────────────────────────

    # 1. Pre-baked HTML table output
    cells.append(md_cell(
        "## Viewer Test: HTML Table Output\n\n"
        "The cell below has a pre-rendered HTML table (simulating a data frame `print()`). "
        "This tests the notebook viewer's HTML output rendering."
    ))
    table_code = (
        "# Data frame display — output pre-rendered for viewer testing\n"
        "farm_data <- data.frame(\n"
        "  crop    = c('wheat', 'corn', 'soybean'),\n"
        "  yield   = c(45, 180, 50),\n"
        "  price   = c(7.50, 4.50, 13.00),\n"
        "  revenue = c(337.50, 810.00, 650.00)\n"
        ")\n"
        "farm_data"
    )
    cells.append(code_cell(table_code, [html_output(SAMPLE_HTML_TABLE)]))

    # 2. Pre-baked PNG image output
    cells.append(md_cell(
        "## Viewer Test: Image Output\n\n"
        "The cell below has a pre-rendered supply & demand plot. "
        "This tests the notebook viewer's image rendering."
    ))
    plot_b64 = make_plot_png_b64(week, title)
    plot_code = (
        "# Supply & demand plot — output pre-rendered for viewer testing\n"
        "P_range <- seq(0, 100, by = 0.5)\n"
        "Qd <- 200 - 2 * P_range\n"
        "Qs <- 20 + 1.5 * P_range\n"
        "plot(Qd, P_range, type='l', col='blue', lwd=2,\n"
        "     xlab='Quantity', ylab='Price', main='Supply & Demand')\n"
        "lines(Qs, P_range, col='red', lwd=2)\n"
        "legend('topright', c('Demand','Supply'), col=c('blue','red'), lty=1)"
    )
    cells.append(code_cell(plot_code, [image_output(plot_b64)]))

    # 3. Empty code cell (edge case test)
    cells.append(md_cell(
        "## Viewer Test: Empty Cell\n\n"
        "The cell below is intentionally empty — the viewer should skip it gracefully."
    ))
    cells.append(code_cell(""))

    # ── Common patterns (if present) ──────────────────────────────────────────
    patterns = data.get("common_patterns", [])
    if patterns:
        cells.append(md_cell("## Common Patterns"))
        for p in patterns:
            cells.append(md_cell(
                f"**{p['pattern']}**\n\n```r\n{p['template']}\n```"
            ))

    # ── Debugging tips (if present) ───────────────────────────────────────────
    tips = data.get("debugging_tips", [])
    if tips:
        rows = "\n".join(
            f"| `{t['error']}` | {t.get('cause','')} | {t.get('fix','')} |"
            for t in tips
        )
        cells.append(md_cell(
            "## Debugging Tips\n\n"
            "| Error | Cause | Fix |\n"
            "|-------|-------|-----|\n"
            + rows
        ))

    return {
        "nbformat": 4,
        "nbformat_minor": 5,
        "metadata": {
            "kernelspec": {
                "display_name": "R",
                "language": "R",
                "name": "ir",
            },
            "language_info": {
                "name": "R",
                "version": "4.3.0",
            },
        },
        "cells": cells,
    }


# ─── Main ──────────────────────────────────────────────────────────────────────
def main():
    base = os.path.expanduser("~/Dropbox/ECON4002S1Y26")

    for week_num in range(1, 13):
        week_dir = os.path.join(base, f"Week{week_num}")
        json_path = os.path.join(week_dir, f"week{week_num}_code_snippets.json")

        if not os.path.exists(json_path):
            print(f"  Week {week_num}: no snippets file — skipping")
            continue

        nb = build_notebook(json_path)
        out_path = os.path.join(week_dir, f"week{week_num}_lab.ipynb")

        with open(out_path, "w") as f:
            json.dump(nb, f, indent=1)

        cell_count = len(nb["cells"])
        print(f"  Week {week_num}: {cell_count} cells → {os.path.basename(out_path)} ✓")


if __name__ == "__main__":
    main()
