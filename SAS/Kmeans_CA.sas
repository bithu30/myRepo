


data kmeans_iris;
set work.iris;

* create a unique identifier to merge cluster assignment variable with 
the main data set;
idnum=_n_;

keep idnum class petal_len petal_wid sep_len sep_wid;

* delete observations with missing data;
 if cmiss(of _all_) then delete;

run;

/*proc print data=kmeans_iris;
var idnum petal_len petal_wid sep_len sep_wid class;
run;*/


ods graphics on;
/*splitting the data set into 70%  training and 30% training
outall specifies that the training and test set will be in the same dataset
with a new variable selected when selected =1 it is train data and when selected = 0 
it is test data
*/

proc surveyselect data=kmeans_iris out=kmeans_train_test seed=123
 samprate=0.7 method=srs outall;

 data kmean_train;
 set kmeans_train_test;
 if selected =1;
 run;

 data kmean_test;
 set kmeans_train_test;
 if selected =0;
 run;

 * standardize the clustering variables to have a mean of 0 and standard deviation of 1;
 proc standard data=kmean_train out=kmeans_var mean=0 std=1;
 var petal_len petal_wid sep_len sep_wid;
 run; 

 
 %macro kmeans_iris(K);
 proc fastclus data=kmeans_var out=kmeans_out&K. outstat=kmeans_stat&K. maxclusters= &K.
 	maxiter=300;
  var petal_len petal_wid sep_len sep_wid;
  run;
 %mend;

%kmeans_iris(1);
%kmeans_iris(2);
%kmeans_iris(3);
%kmeans_iris(4);
%kmeans_iris(5);
%kmeans_iris(6);

* extract r-square values from each cluster solution and then merge them to plot elbow curve;
data clus1;
set kmeans_stat1;
nclust=1;

if _type_='RSQ';

keep nclust over_all;
run;

data clus2;
set kmeans_stat2;
nclust=2;

if _type_='RSQ';

keep nclust over_all;
run;

data clus3;
set kmeans_stat3;
nclust=3;

if _type_='RSQ';

keep nclust over_all;
run;
data clus4;
set kmeans_stat4;
nclust=4;

if _type_='RSQ';

keep nclust over_all;
run;

data clus5;
set kmeans_stat5;
nclust=5;

if _type_='RSQ';

keep nclust over_all;
run;

data clus6;
set kmeans_stat6;
nclust=6;

if _type_='RSQ';

keep nclust over_all;
run;
*combining all r squares of the clusetrs into one dataset ;
data kmeans_rsquare;
set clus1 clus2 clus3 clus4 clus5 clus6;
run;
proc contents data=kmeans_rsquare;run;
proc print data=kmeans_rsquare;
var nclust over_all;
run;
* plot elbow curve using r-square values;
symbol1 color=blue interpol=join;
proc gplot data=kmeans_rsquare;
plot over_all*nclust;
run;
*plot for the 3 cluster solution;
proc candisc data=kmeans_out3 out=clust_check;
class cluster;
var petal_len petal_wid sep_len sep_wid;
run;

proc sgplot data=clust_check;
scatter x=can1 y=can2 / group=cluster;
run;

proc candisc data=kmeans_out5 out=clust_check;
class cluster;
var petal_len petal_wid sep_len sep_wid;
run;

proc sgplot data=clust_check;
scatter x=can1 y=can2 / group=cluster;
run;

proc candisc data=kmeans_out6 out=clust_check;
class cluster;
var petal_len petal_wid sep_len sep_wid;
run;

proc sgplot data=clust_check;
scatter x=can1 y=can2 / group=cluster;
run;




