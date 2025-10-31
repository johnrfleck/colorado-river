# colorado-river
## John Fleck's Colorado River datasets and analysis tools
## Utton Center, University of New Mexico School of Law

## Scripts

### mead-powell-total-graph.r
Fetches daily storage data directly from USBR for Lake Mead and Lake Powell, merges the datasets, calculates combined storage, and creates a time series visualization. The script handles the different data availability for each reservoir by truncating to the last date where both reservoirs have current data, avoiding false zeros when one data source hasn't been updated. Outputs a line plot showing storage levels (in millions of acre feet) for Mead, Powell, and their combined total.

### lower-basin-use-graph.r
Creates a 2-by-2 faceted visualization of Colorado River Lower Basin water use by state. Shows trends for California, Arizona, and Nevada individually, plus a combined total for the Lower Basin. Each panel has independent y-axes (starting at zero) to highlight state-specific patterns. Data is from the US Bureau of Reclamation.

**Data Note:** lower-basin-use.csv was updated with preliminary estimates as of October 31, 2025.
