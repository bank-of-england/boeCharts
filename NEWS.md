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



