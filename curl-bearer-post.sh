#generated like this:
#curl -X POST -H "ContentType: application/json" -d '{"username":"xxx", "password":"111"}' http://xxx
read -p 'curl data:' data
read -p 'curl token string:' tokenString 
read -p 'curl post url:' url 
curl -d $data -H "Authorization: Bearer $tokenString" -v $url

