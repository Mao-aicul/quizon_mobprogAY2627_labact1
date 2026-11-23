# Quizon, Maureen Lucia P.
# INF247MWA

# Laboratory 1

# Discussion:
# I created a new property called imagePath beside the hasImage that was already there. hasImage is a bool that is false by default, so a card has no image unless I set it to true. Inside the build method I used "if (widget.hasImage)" before the Image.asset widget, which means the image is only added to the column when the post really has one. When it is false, nothing is added and the card just ends after the post text, like the first card in the feed. The image is inside a SizedBox with a fixed height so all the pictures have the same area, and I used BoxFit.contain so the whole picture can be seen. I also added an errorBuilder that shows a grey box with an icon if the file can't be loaded, so the app doesn't crash when the path is wrong. The image files are saved in assets/images and listed in pubspec.yaml. In newsfeed_screen.dart, each card only passes hasImage and imagePath, and the card decides on its own if it will show a picture or not.