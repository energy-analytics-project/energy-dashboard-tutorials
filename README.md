# energy-dashboard-tutorials
Data science tutorials using the Energy Dashboard data sets.

## Energy Dashboard Tutorials

These tutorials assume you have an understanding of the tooling and concepts
(see `Background` section below). The focus of these tutorials is less on how
to use Pandas and more on how to examine and query the [Energy Dashboard
datasets](https://github.com/energy-analytics-project/energy-dashboard/blob/master/docs/datasets.md)
to produce meaningful analyses and reports.

* [Tutorial 01 : Renewable Wind and Solar](./tutorial-01.ipynb)
* Tutorial 02 : work in process

## Quick Start

### Dependencies

There's one main dependency, and that's `conda`...

* [conda](https://www.anaconda.com/distribution/)

If you do not have 'git' installed, then you can retrieve this tutorial by
clicking on the [download
link](https://github.com/ToddG/energy-dashboard-tutorials/archive/master.zip).

### Instructions

```bash
conda create -n ed python=3 numpy jupyter pandas matplotlib seaborn statsmodels jupyterlab pandasql
conda activate ed
git clone git@github.com:ToddG/energy-dashboard-tutorials.git
cd energy-dashboard-tutorials
./build.sh
jupyter-lab
```

The `build.sh` will download, extract, and test the databases that we will
be using in these tutorials.

----

## Background

If you don't have a solid grasp of Pandas and Python, start here.

### Pandas + Python

* Watch Brandon Rhodes' PyCon 2015 Talk
* Solve Rhodes' excercise problems, one notebook at a time
* Backup, watch Rhodes' video again, continue solving the excercises
* Go through VanderPlas' book and, as much as you can, replicate every single line of code
* Go back, watch Rhodes' video again 

If you don't remember stats, Sal Khan is my 'go-to' resource for all
things academic:

* Watch the Khan Academy videos on statistics

This is just how _I_ learned Pandas and brushed up on stats. YMMV.

### Links

#### Tutorials

* [Brandon Rhodes PyCon 2015 Tutorial](https://github.com/brandon-rhodes/pycon-pandas-tutorial)
* [Errata for BR Tut #1](https://stackoverflow.com/questions/45916325/series-object-has-no-attribute-order#45993193)
* [Errata for BR Tut #2](https://stackoverflow.com/questions/44123874/dataframe-object-has-no-attribute-sort#44123892)

(Brandon Rhodes' video errata due to changes in Pandas since 2015)

#### Videos

##### Pandas

* [PandasDocs](https://pandas.pydata.org/pandas-docs/stable/reference/frame.html)
* [Brandon Rhodes PyCon2015](https://www.youtube.com/watch?v=5JnMutdy6Fw)
* [MultiIndexs](https://www.youtube.com/watch?v=kP-0ET0V5Tc)
* https://towardsdatascience.com/analyzing-time-series-data-in-pandas-be3887fdd621
* https://ourcodingclub.github.io/2019/01/07/pandas-time-series.html
* https://pypi.org/project/pandasql/
* http://earthpy.org/pandas-basics.html
* https://chrisalbon.com/python/data_wrangling/pandas_time_series_basics/
* https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html

##### Stats

* [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

#### Libraries

* [jupyterlab-vim](https://github.com/jwkvam/jupyterlab-vim)

#### PandSql

I really really wanted to use [pandasql](https://pypi.org/project/pandasql/).
It's SQL! It uses Sqlite! It'll be awesome, right!

Unfortuntely, the project appears to be abandon-ware. More importantly, it's
slow. I tested `pandasql` on Brandon Rhodes' tutorials, expecting to blaze
through them all in short order. My sense of delight and ease from writing SQL
was soon swamped by the performance issues. I stopped when fairly simple
queries were taking between 10 and 100x longer when using `pandasql` instead of
direct dataframe manipulations.

Also, I tried both the old style invocation:

    pdf = lambda q: sqldf(q, globals())

...and the new style:

    pdf = PandaSQL('sqlite:///:memory:', persist=True)

I detected no real difference. Bummer. RIP `pandasql`.

#### Sqlite3

* https://dba.stackexchange.com/questions/40656/how-to-properly-format-sqlite-shell-output
* https://stackoverflow.com/questions/685206/how-to-get-a-list-of-column-names


#### Books

* [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)


#### Energy Sector Resources
* https://www.nwcouncil.org/reports/seventh-power-plan
* https://www.theice.com/products/6590362/CAISO-NP-15-Day-Ahead-Peak-Fixed-Price-Future
* http://www.caiso.com/participate/Pages/LearningCenter/default.aspx
* http://www.caiso.com/pricemap/Pages/default.aspx
* http://www.caiso.com/TodaysOutlook/Pages/prices.aspx
* http://www.caiso.com/TodaysOutlook/Pages/supply.aspx
* http://www.energybc.ca/index.html
* http://www.ercot.com/about
