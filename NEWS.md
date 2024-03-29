# boeCharts 1.3.4

## Minor changes

- Remove {ggtext} dependency

# boeCharts 1.3.3

## New features

- Added a [Bank identity]() theme. See `theme_boe_identity()`
- Added new Bank identity colour palettes:
    - Core: `boe_identity`, `boe_brand_main`, `boe_brand_secondary`
    - Shades: `boe_shades_aqua`
- `add_hline0()` utility function for strong horizontal rule at "zero"
- `geom_text_boe_identity()` and `annotate_boe_identity()` Bank-style wrappers 

# boeCharts 1.3.2

## New features

- Added `gold_holdings` and `sovereign_defaults` example datasets
- `label_year_short()` for formatting year labels as specified in new identity 
guidelines
- `label_euro()` for formatting euro currency labels
- `scale_x|y_year()` for formatting year labels with `label_year_short()`

## Minor changes

- Fix linux machine installation issues (#1308)
- Renamed existing labeller functions to match {scales} package API
- More unit testing for breaks, labelling and scales
- Rationalised documentation pages in a few places

# boeCharts 1.3.1

## Breaking changes

- Tweaks to axis text margins in `theme_fsr()` and `theme_mpr()`
- Edited `base_colour` in `theme_fsr()`, `theme_mpr()` and `theme_overground()`
- Edited caption justification in `theme_overground()`

## New features

- Added `install_rttf2pt1()` to install specific version of {rttf2pt1} that supports custom font import

## Minor changes

- Remove `ggplotify` dependency

# boeCharts 1.3.0

## Breaking changes

- Removed `theme_inflation_report()`

## New features

- Added `position_voronoi()` to support direct line labelling (based on [this outstanding ggplot2 issue](https://github.com/tidyverse/ggplot2/issues/3093))
- Added `theme_fsr()` and `fsr_palettes` for FSR-style charts
- Added `caption_boe()` for formatting data sources and footnotes in chart captions
- Added markdown variants for each {boeCharts} theme `theme_xxx_md()` to support markdown formatting

## Minor changes

- Demoted `grid`, `gtable` and `ggplotify` dependencies to "Suggests" (from "Imports"), add `ggtext` and `glue` imports

# boeCharts 1.2.3

- Simple patch to use `ggplotify` instead of `patchwork` to convert a `gtable`
object to a `ggplot` object in `move_ylab()` function

# boeCharts 1.2.2

- Simple patch to add names to all `pre_mpc`colours

# boeCharts 1.2.1

- Simple patch to add font import helpers (`import_arial|calibri()`)

# boeCharts 1.2.0

## Breaking changes

- `plot_title_position` argument introduced to all themes (following introduction of `plot.title.position` in `ggplot2` [3.3.0 update](https://www.tidyverse.org/blog/2020/03/ggplot2-3-3-0/#grab-bag)), titles now fixed left ("plot") by default 
- `theme_overground()`:
    - Base font size (`base_size`) 11.5 (was 18), `plot_title_size` now 18 (was 28), `subtitle_size` now 14 (was 22)
    - `legend_position` now "top" (was "bottom")
    - Margin arguments removed (bar `plot_margin` and `legend_margin`, which are now sized relatively)
- `theme_mpr|inflation_report()` (h/t to Adam Brinley Codd for suggestions):
    - All text elements in Calibri font by default, and resized to be in-line with `theme_overground()`
    - Title, subtitle and caption left-justified by default
    - Legend position top-left of plot area (and left-justified)
    - `x` and `y` labels are *not* removed by default
- `theme_mcg_pub()`:
    - All text elements resized to be in-line with `theme_overground()`
    

## New features

- Added axis breaks/limits helper functions for numeric (`boe_breaks|limits_numeric()`) and date/time (`boe_breaks_limits_date()`) variables
- Added font import utilities (`import_arial|calibri()`) and aliases for commonly used fonts (`font_arial|calibri|calibri_light`) across all OS' and devices (inc. PDF)
- Added `move_ylab()`, allows y-axis title to be positioned above the axis line and plot area
- Added *pre-MPC* colour palettes, `pre_mpc` and `pre_mpc_light`
- Added all parameters in `theme_overground()` to `theme_mpr|inflation_report|mcg_pub()`

## Minor changes

- Deprecated `theme_inflation_report()` in favour of `theme_mpr()`
- System library installation of `Rttf2pt1` handled (reasoning explained in [this note](http://collaborate/workspaces/RHelpCentre/R%20Markdown/Importing_Custom_Fonts.html))
- Deprecated `left_align_titles()` in favour of setting `plot_title_position` argument in custom theme functions

# boeCharts 1.1.0

## Breaking changes

* Palettes now follow a standardised, lower snake-case naming convention (e.g. `boe_rich` instead of `boeRich`) everywhere.
* `scale_[colour|fill]_discrete_boe()` is the new name(s) of the function(s) previously known as `scale_colour|fill_boe()`. The original functions will throw warnings, directing you to the new functions (but will throw errrors in future versions).
* `boe` (2016 visual identity guidelines) palette has been reordered for more visual distinctiveness.

## New functions

* Implementation of [harmonious/vibrant colour combinations](https://bankofengland.frontify.com/d/RPk6pMZziBFw/bank-standards#/brand-elements/colour-palette) as supported palettes. See `boe_harmonious_palettes` and `boe_vibrant_palettes`.
* Diverging, [ColorBrewer](http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3)-style palettes. See `boe_diverging_palettes`.
* Continuous `ggplot2`-supported scales which play nicely with any palette but particularly the harmonious and diverging ones. See `scale_[colour|fill]_continuous_boe()`. 
* A [Bank Overground](https://www.bankofengland.co.uk/bank-overground) theme. See `theme_overground()`. Note: auto Calibri font-handling is currently Windows-only.
* `left_align_titles()` for forcing titles to left of chart area.
* `update_geom_font_defaults()` for updating font defaults for text geoms.
* `palette_names()` for returning names of available palettes.
* `show_colour_swatches()` for displaying a PDF with colours and names of palettes.
* `colours_from_palette()` for extracting HEX values for a given palette.

## Minor changes

* All palettes stored as lists, now support semantic colour picking e.g. `boe$red`.
* Palettes stored in "lists of lists" (e.g. `boe_harmonious_palettes`), allowing for semantic subsetting of palette options.
* Pass palette name as a string (`“boe_rich”`) or the palette itself (`boe_rich` or `boe_palettes$boe_rich`) into scales, functions, etc.
* Pretty-printing s3 methods for palettes.


# boeCharts 1.0.0

* First release. Codebase built from `boeThemes` and `dsdthemes`.



