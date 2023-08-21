#!/bin/sh
fbranch=automation
branch=$(git symbolic-ref --short HEAD)

if [ $branch == $fbranch ]
then
    echo "Branch is currect"
else
    echo "Branch is not currect"
    git checkout $fbranch
fi
branch=$(git symbolic-ref --short HEAD)
echo $branch
git add test.txt fty/
commit="Added renewed SSL certs"
echo $commit
git commit -m "$commit"
git push origin $branch
# PR create
# Variables
curl -X POST \
  -H "Authorization: Bearer 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" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/nabad600/testing/pulls \
  -d '{
    "title": "Added renewed SSL certs",
    "head": "automation",
    "base": "main"
  }'
  GPRN=`echo ::set-env name=PULL_NUMBER::$(echo "$GITHUB_REF" | awk -F / '{print $3}')`
  echo $GPRN

curl -X POST --data-urlencode "payload={\"channel\": \"#ssl-certs-github-deck\", \"username\": \"webhookbot\", \"text\": \"Please review the code and merge regading renewed SSL certificate https://github.com/nabad600/testing/pulls.\", \"icon_emoji\": \":ghost:\"}" https://hooks.slack.com/services/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