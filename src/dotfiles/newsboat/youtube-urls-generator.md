# newsboat-url-generator
Original project: [newsboat-url-generator](https://github.com/cfelipe/newsboat-url-generator) 
This script gets your Youtube subscriptions and generate a urls file for Newsboat

## Requirements
No one, but if you pretend to use the option that brings all your subscriptions you may want to follow the steps bellow.

* You will need to find your youtube channel id through [this guide](https://support.google.com/youtube/answer/3250431?hl=en)
(Remember, is the channel id, not the user id.)

* Check your [privacy settings](https://www.youtube.com/account_privacy). To run this script your subscriptions needs to be visible to others, so make sure the option bellow its uncheck. You can check this option again after running the script.

![image](https://i.imgur.com/B30d1Ad.jpg)

## Usage Example

## Importing all your subscriptions from your youtube channel id:

```
$ python newsboat-urls-generator.py -i UIasndj8734nAJSNasfna2 -v

Your channel id: AidnJamask82JamndkajhH
Generating for Luke Smith
Generating for TED
Generating for Chris Were

Done! A total of 3 channels written in my_urls file
```

The script will create a text file with the following content:

```
https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA "Youtube" "!Luke Smith"
https://www.youtube.com/feeds/videos.xml?channel_id=UCAuUUnT6oDeKwE6v1NGQxug "Youtube" "!TED"
https://www.youtube.com/feeds/videos.xml?channel_id=UCAPR27YUyxmgwm3Wc2WSHLw "Youtube" "!Chris Were"

"query:Youtube:tags # \"Youtube\""

```

## Generating a newsboat URL from a any youtube channel URL

```
python newsboat-urls-generator.py --channel-url https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA

https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA "Youtube" "!Luke Smith"
```

Now from a URL that contains the username

```
python bewsboat-urls-generator.py --channel-url https://www.youtube.com/user/ChrisWereDigital

https://www.youtube.com/feeds/videos.xml?channel_id=UCAPR27YUyxmgwm3Wc2WSHLw "Youtube" "!Chris Were"
```

## Available options

```
python youtube-urls-generator.py --help

usage: newsboat-urls-generator.py [-h] [-i CHANNEL_ID] [-u CHANNEL_URL] [-v]

optional arguments:
  -h, --help            show this help message and exit
  -i CHANNEL_ID, --channel-id CHANNEL_ID
                        your youtube channel id
  -u CHANNEL_URL, --channel-url CHANNEL_URL
                        youtube url channel to convert. needs channel
                        username.
  -v, --verbose         verbose mode
```
