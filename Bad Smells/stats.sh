for repo in "anon2" "anon4" "anon6"
do sqlite3 -csv ${repo}.db "select cl.issueID, (cl.time - op.time) as timeOpen from event cl, (select issueID, min(time) as time from event group by issueID) op where cl.action == 'closed' AND cl.issueID == op.issueID;" > ./csv/open_close/${repo}.csv
sqlite3 -csv ${repo}.db "select ev.issueID, ev.time-milestone.due_at as secondsAfter from (select issueID, time, milestone from event ev1 where action = 'closed' and milestone not null and time >= (select max(time) from event where issueID = ev1.issueID and action = 'closed')) ev, milestone where milestone.id = ev.milestone;" > ./csv/milestone_delay/${repo}.csv
sqlite3 -csv ${repo}.db "select e1.issueID, (e1.time - (mileDur.due_at - mileDur.duration)) as timeAfterStart, mileDur.duration as duration from event e1, (select m2.id, m2.due_at, (m2.due_at - m1.due_at) as duration from milestone m1, milestone m2 where m2.id = m1.id+1) mileDur where e1.milestone = mileDur.id and e1.action = 'closed' and e1.time >= (select max(time) from event where event.action = 'closed' and issueID = e1.issueID);" > ./csv/preshooting/${repo}.csv
sqlite3 -csv ${repo}.db "select label, count(*) from (select issueID, label from event e1 where action = 'assigned' and time >= (select max(time) from event where e1.issueID = issueID and action = 'assigned')) group by label;" > ./csv/assignments/${repo}.csv
sqlite3 -csv ${repo}.db "select issueID, count(distinct user) from comment group by issueID;" > ./csv/issue_comment/${repo}.csv
sqlite3 -csv ${repo}.db "select user, count(*) from event e1 where time <= (select min(time) from event where issueID = e1.issueID) group by user;" > ./csv/issue_create/${repo}.csv
sqlite3 -csv ${repo}.db "select issueID, count(*) from comment group by issueID;" > ./csv/issue_numcomments/${repo}.csv
sqlite3 -csv ${repo}.db "select bugs, count(distinct issueID) as issues, (bugs+0.0)/count(distinct issueID) as ratio from (select count(*) as bugs from event where lower(label) like '%bug%' and action == 'labeled'), event;" > ./csv/bugratio/${repo}.csv
sqlite3 -csv ${repo}.db "select user, count(*) as comments from comment group by user;" > ./csv/comments_user/${repo}.csv
sqlite3 -csv ${repo}.db "select numShort, numTotal, (numShort+0.0)/numTotal from (select count(*) as numShort from event cl, (select issueID, min(time) as time from event group by issueID) op where cl.action == 'closed' AND cl.issueID == op.issueID and (cl.time - op.time) < 3600), (select count(distinct issueID) as numTotal from event);" > ./csv/short_open/${repo}.csv
done
find ./csv/ -size  0 -exec rm '{}' \;
