twitter
=======

This code polls the twitter API regularly and retrieves the latest tweet from a given user. If the tweet has a certain command in it, like "ledon", then it activates some GPIO pins on the raspberry PI.

I found this page on the twitter api docs useful to figure out how to get tokens to poll their api

https://dev.twitter.com/docs/auth/application-only-auth

and this to do base64 encode

http://www.opinionatedgeek.com/DotNet/Tools/Base64Encode/default.aspx
