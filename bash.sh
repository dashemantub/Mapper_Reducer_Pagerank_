
start-hadoop.sh

hdfs dfs -mkdir input

hdfs dfs -copyFromLocal $HOME/books input/books

hdfs dfs -ls input/books

hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books/* -output pagerank/output

hdfs dfs -cat pagerank/output/*
hdfs dfs -copyToLocal pagerank/ $HOME/pagerank
hdfs dfs -copyFromLocal $HOME/pagerank/output input/books1


hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books1/* -output pagerank1/output



hdfs dfs -cat pagerank1/output/*
hdfs dfs -copyToLocal pagerank1/ $HOME/pagerank1
hdfs dfs -copyFromLocal $HOME/pagerank1/output input/books2



hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books2/* -output pagerank2/output

hdfs dfs -cat pagerank2/output/*
hdfs dfs -copyToLocal pagerank2/ $HOME/pagerank2
hdfs dfs -copyFromLocal $HOME/pagerank2/output input/books3


hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books3/* -output pagerank3/output

hdfs dfs -cat pagerank3/output/*
hdfs dfs -copyToLocal pagerank3/ $HOME/pagerank3
hdfs dfs -copyFromLocal $HOME/pagerank3/output input/books4

hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books4/* -output pagerank4/output

hdfs dfs -cat pagerank4/output/*
hdfs dfs -copyToLocal pagerank4/ $HOME/pagerank4
hdfs dfs -copyFromLocal $HOME/pagerank4/output input/books5

hadoop jar $HOME/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.4.jar \
-file $HOME/sp_mapper.py -mapper $HOME/sp_mapper.py \
-file $HOME/sp_reducer.py -reducer $HOME/sp_reducer.py \
-input input/books5/* -output pagerank5/output

hdfs dfs -cat pagerank5/output/*
hdfs dfs -copyToLocal pagerank5/ $HOME/finalpagerank
hdfs dfs -copyFromLocal $HOME/finalpagerank/output input/books6

rm -r pagerank
rm -r pagerank1
rm -r pagerank2
rm -r pagerank3
rm -r pagerank4





