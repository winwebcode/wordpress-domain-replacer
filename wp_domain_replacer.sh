#files may be need convertation use dos2unix

USER=user #pass mysql root
PASSWORD=pass #user mysql
 
echo -e "Wait few minutes, replace start\n"

### in file replace.txt put query for example: "use your_database; UPDATE wp_posts SET post_content =REPLACE(post_content, 'domain.info', 'newdomain.info');" without quotes in begin and end of string
### choising database and your query must be in one string without quotes in begin and end of string.

file="replace.txt"
IFS=$'\n' ######look https://habr.com/ru/company/ruvds/blog/325928/
for namefile in $(cat $file)
do
	mysql -u$USER mysql -p$PASSWORD  --execute="$namefile"
	echo -e "taking next table\n" 
done
echo -e "I finished!" 