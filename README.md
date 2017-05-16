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

tail -F /tmp/testcafe | grep -o --line-buffered http.* |
xargs -n 1 -I % docker run --rm \
    --name potato \
    -v "`pwd`/record:/session" \
    martinsthiago/chrome:58.0.3029.96 google-chrome % >& /dev/null &
testcafe --ports 9505,9506 remote:1 test.js |& tee /tmp/testcafe /tmp/stdout; kill $(jobs -p); sleep 10 && docker kill potato; rm /tmp/testcafe
sudo chown -R $USER ./record
```

## Release Chrome Images Automatically

Setup your server to watch chrome-releases with this script

```bash
git clone https://github.com/MartinsThiago/chrome.git &&
cd chrome && chmod +x ./chrome-auto-push-installer.sh &&
./chrome-auto-push-installer.sh
```