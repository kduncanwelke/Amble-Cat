## Micro Kitty
Step tracking made cute!

Micro Kitty (formerly Amble Cat) accesses Core Motion on a user's device to provide step tracking data in a fun and easy format. Current step count for the day is displayed on the main view, with step history displayed in list format. The user cares for a cat, which acts as their companion, featuring cute art and customizable rooms. By walking, a user earns Paw Points based on their step count, and they may even see kitty walk with them. This in-app currency can then be used to spent in the decor shop to purchase new styles of items. Working towards new purchases helps provide a fun, simple motivation for a user to keep walking regularly. The app also features a Paw Point shop, which allows real money to be used for in-app purchases that will get the user more Paw Points to spend. 

<img src="https://kduncanwelkecom.ipage.com/Micro%20Kitty%20Preview.png">

## Description
Micro Kitty brings you step tracking with a twist!

Enjoy the company of a feline friend (Lucy) and collect Paw Points as you walk! Spend your Paw Points in the decor shop to customize your rooms - a variety of items creates constant new goals for you to work towards, for the more you walk the more Paw Points you'll earn, and the more you can spend!

With an easy to use interface, cute retro pixel-themed art art, and accurate step counting from Core Motion, Micro Kitty makes step tracking simple and rewarding!

Features include:

* Earn Paw Points live as you walk!
* Main room, kitchen, bathroom and outdoor views
* Toggle between room views
* Bap the Mouse mini game!
* More decor items available!
* Purchase new decor items to customize your cat's room
* More animations and locations for a more immersive experience
* Responsive to your movements - if you walk, Lucy might too!
* Intuitive, easy to use interface with sound feedback
* Hearts for each consecutive day of care - fill them all and earn a surprise!
* Current status view with step count and distance covered
* Step history displayed in a convenient list view (past seven days of recorded steps available)
* Equip your items from Decor Shop, simply tap to apply
* In-app purchases Paw Points in the Paw Point shop
* Toggle between mile and meter measurements from the info page

## Dependencies
[OpenSSL-Universal](https://cocoapods.org/pods/OpenSSL-Universal) handles cryptography to help secure receipt validation. [Cocoapods](https://github.com/CocoaPods/CocoaPods) has been used as the dependency manager for this project - please refer to Cocoapods documentation for details.

The integration of these items in the Podfile for this project is as follows:
```
pod 'OpenSSL-Universal'
```

Details on use of each dependency and the Cocoapods manager itself can be found in the links already included.

## Features
This app features a main view with a room (instead of the other way around) where the cat is shown in a decorated space. The user can switch rooms by tapping one of the three buttons to make their choice. A walking view outdoors may also be toggled when the user is moving with the device.

Above this view is an area with current step count and distance covered, along with hearts (which symbolize consecutive days of care for the cat), and the current Paw Point total. Below are buttons for care actions, and links to the decor shop and paw point store.

Small animations for the cat are displayed, some based on care actions the user has taken. 

Paw Points for walking are credited as the user walks, so they earn points as they accrue steps. A small bonus may be present if the user has filled all seven of the care indication hearts as well.

The user navigates through the app primarily by using on screen buttons, which mimic the experience of a virtual pet toy. The user can give the cat food and water via the buttons, visit the decor shop, or the point shop.

The first button - a mouse image - leads to a mini-game of Bap-a-Mouse, in style similar to whack-a-mole. Each round costs 5 Paw Points to play, and a player wins a random PP amount from each successful bap.

The history button leads to a view of step history. Presuming the user has provided Core Motion access, this view will display step history.

The decor shop allows a user to spend their Paw Points, and get new colors or styles of items to add to their cat's rooms. Points are stored in Core Data and updated accordingly. Sound feedback is supplied in the shop depending on if the point quantity is sufficient for a purchase or not. Purchased items can then be equipped by tapping them (blue background indicates current equipments). These equipment selections are also saved in Core Data so they are maintained across device launches.

The Paw Points show contains in-app purchases which use Storekit and a product request to retrieve items. A notice is displayed if the device does not support purchases, and a network monitor ensures the presence of a network connection before attempting a request. Upon success of the purchase, the receipt is validated, and if valid, the user is then credited with the appropriate number of Paw Points.

## Art
Various art is included in this app, from the cat and its animation to all of its associated decors item, to provide a lightheartedness and friendly, encouraging environment. This art was created by myself (the developer) and belongs to no one else. The cat pictured - Lucy - is based on a real-life feline, to whom credit for inspiration goes.

## Support
If you experience trouble using the app, have any questions, or simply want to contact me, you can contact me via email at kduncanwelke@gmail.com. I will be happy to discuss this project.

## Acknowledgement
Some inspiration for this app came from a group of friends - my thanks go out to them for helping provide thoughts that led to this app coming to realization. Sounds for this app came from [Zapsplat](http://zapsplat.com), and Mark DiAngelo and Popup Pixels on [Soundbible](http://soundbible.com). [Dogica Pixel](https://www.dafont.com/dogica.font) font by Roberto Mocci.
