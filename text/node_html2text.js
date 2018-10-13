/* 
    Example of how to do html->text using javascript (installed via node npm).

    Documentation here: https://github.com/werk85/node-html-to-text

    uppercaseHeadings false because we want to treat h3 contents like any other words
    ignoreImage true because we're doing text analysis
    unorderedListItemPrefix set to "" so that we don't get a bunch of *'s all over,
        which is the default prefix


 */

//var test1 = "<h3><span><div>Hey</div>whatup</span>Cool</h3>"
var test_str = "<a href='http://bad.link'>I don't want the link just this text</a> Ok.";
var htmlToText = require('html-to-text');
var text = htmlToText.fromString(test_str,
    {uppercaseHeadings: false,
     ignoreImage: true,
     unorderedListItemPrefix: "",
     ignoreHref: true
});
console.log(text)