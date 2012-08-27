# TSP Visualizer

TSP (Travelling Salesperson Problem) files are generated from
TSPLIB. See [TSPLIB95][1]'s site for more details.

The main purpose of this project to help me in my AI course in
UofL's masters program for Computer Science. Currently the project
only shows the points on a chart. It's a web-project and uses the
following technologies:

- Ruby
- Sinatra
- Haml
- jQuery
- HighCharts


To run it locally, run:

```bash
git clone git://github.com/JohnMurray/tsp-web.git
cd tsp-web
bundle install --binstubs
./bin/thin start   # starts on localhost:3000
```


  [1]: http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/
