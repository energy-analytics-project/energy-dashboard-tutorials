# energy-dashboard-tutorials
Data science tutorials using the Energy Dashboard data sets.

## Getting Started

### Pandas + Python

If you don't have a solid grasp of Pandas and Python, start here:

* Watch Brandon Rhodes PyCon 2015 Talk
* Solve Brandon's excercise problems, one notebook at a time
* Backup, watch Rhodes' video again, continue solving the excercises
* Go through VanderPlas' book, replicate every single line of code

If you don't remember stats, Sal Khan is my 'go-to' resource for all
things academic:

* Watch the Khan Academy videos on statistics

This is just how I learned Pandas and brushed up on stats. YMMV.

### Energy Dashboard Tutorials

These tutorials assume you have an understanding of the tooling and concepts (see Pandas +
Python above). The focus here is to show you how to examine and query the [Energy
Dashboard datasets](https://github.com/energy-analytics-project/energy-dashboard/blob/master/docs/datasets.md)
to produce meaningful analyses and reports.

* [TUT 01 : NYI]()


## Links

These were all useful for me when getting started with Pandas...

### Tutorials

* [Brandon Rhodes PyCon 2015 Tutorial](https://github.com/brandon-rhodes/pycon-pandas-tutorial)
* [Errata for BR Tut #1](https://stackoverflow.com/questions/45916325/series-object-has-no-attribute-order#45993193)
* [Errata for BR Tut #2](https://stackoverflow.com/questions/44123874/dataframe-object-has-no-attribute-sort#44123892)

(Brandon Rhodes' video errata due to changes in Pandas since 2015)

### Videos

#### Pandas

* [PandasDocs](https://pandas.pydata.org/pandas-docs/stable/reference/frame.html)
* [Brandon Rhodes PyCon2015](https://www.youtube.com/watch?v=5JnMutdy6Fw)
* [MultiIndexs](https://www.youtube.com/watch?v=kP-0ET0V5Tc)

#### Stats

* [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

### Libraries

* [jupyterlab-vim](https://github.com/jwkvam/jupyterlab-vim)

### PandSql

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

### Sqlite3

* https://dba.stackexchange.com/questions/40656/how-to-properly-format-sqlite-shell-output
* https://stackoverflow.com/questions/685206/how-to-get-a-list-of-column-names


### Books

* [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)
