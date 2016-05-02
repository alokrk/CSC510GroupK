for repo in "anon2" "anon4" "anon6"
do sqlite3 -csv ${repo}.db "select * from milestone;" > ./dmp/${repo}_milestone.csv
sqlite3 -csv ${repo}.db "select * from issue;" > ./dmp/${repo}_issue.csv
sqlite3 -csv ${repo}.db "select * from event;" > ./dmp/${repo}_event.csv
sqlite3 -csv ${repo}.db "select * from comment;" > ./dmp/${repo}_comment.csv
sqlite3 -csv ${repo}.db "select * from commits;" > ./dmp/${repo}_commits.csv
done
find ./dmp/ -size  0 -exec rm '{}' \;
