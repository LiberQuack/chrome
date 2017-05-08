# CHROME
Containerized chrome for testing with video recording - 
_Because headless tests aren't enough_

## Prologue
Didn't get how to use this image? If your front-end tests are written with
[TestCafe](https://devexpress.github.io/testcafe/) you can run them with remote 
browsers... Got it?

## Example
Let's try an example (Container Manual Start)

```bash
git clone https://github.com/DevExpress/testcafe.git
cd testcafe/examples/basic
testcafe remote test.js
```

Advanced example (Automatically Start Chrome Container)

```bash
git clone https://github.com/DevExpress/testcafe.git
cd testcafe/examples/basic

testcafe --ports 9505,9506 remote:1 test.js |&
tee /dev/stderr |
grep -o --line-buffered http.* |
xargs -n 1 -I % \
    docker run --rm \
    -v "`pwd`/record:/session" \
    martinsthiago/chrome:58.0.3029.96 google-chrome % >& /dev/null &     
```

## Docker Automated Build

This snippet show how this chrome image is set updated

```bash

git clone https://github.com/MartinsThiago/chrome.git &&
cd chrome && chmod +x ./chrome-auto-push-installer.sh &&
./chrome-auto-push-installer.sh
```