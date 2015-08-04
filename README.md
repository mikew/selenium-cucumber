# selenium-cucumber

A docker image with:

- [selenium-cucumber](http://seleniumcucumber.info/)
- Google Chrome
- Mozilla Firefox
- Xvfb

Mozilla Firefox is the default browser, you are free to change it by
setting `BROWSER` in the environment.

Everything is run in a Xvfb session, and that session is recorded to a
`.mp4` file in `/app-tests/videos`. The video name defaults to
`BROWSER-TIMESTAMP`, and can be changed by setting `VIDEO_NAME`.

Set `DISABLE_VIDEO=1` to disable screen recording.

Set `DISABLE_XVFB=1` to disable Xvfb (if you need to tinker). Will
detect if you pass `bash` as a command.

## Usage

Given your current directory has a selenium-cucumber structure:

```bash
docker pull mikewhy/selenium-cucumber

docker run \
    --rm \
    --volume "$PWD":/app-tests \
    mikewhy/selenium-cucumber \
    cucumber --color
```
