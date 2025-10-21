# colorado-river
## John Fleck's Colorado River datasets and analysis tools
## Utton Center, University of New Mexico School of Law

## Scripts

### mead-powell-total-graph.r
Fetches daily storage data directly from USBR for Lake Mead and Lake Powell, merges the datasets, calculates combined storage, and creates a time series visualization. The script handles the different data availability for each reservoir by truncating to the last date where both reservoirs have current data, avoiding false zeros when one data source hasn't been updated. Outputs a line plot showing storage levels (in millions of acre feet) for Mead, Powell, and their combined total.
