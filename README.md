# Amble-Cat
Cute step tracking

AmbleCat integrates with the Health app on a user's device, via Healthkit, to provide step tracking data in a fun and easy format. Current step count for the day is displayed in a 'currents' view, with complete step history displayed in graph format. The user cares for a cat, which acts as their companion, featuring cute art and a customizable room. By walking, a user earns Paw Points based on their step count. This in-app currency can then be used to spent in the decor shop to purchase new styles of items. Working towards new purchases helps provide a fun, simple motivation for a user to keep walking regularly. The app also features a Paw Point shop, which allows real money to be used for in-app purchases that will get the user more Paw Points to spend. 

## Dependencies
[Charts](https://github.com/danielgindi/Charts) is used in this project to provide graph views of data, and [OpenSSL-Universal](https://cocoapods.org/pods/OpenSSL-Universal) handles cryptography to help secure receipt validation. [Cocoapods](https://github.com/CocoaPods/CocoaPods) has been used as the dependency manager for this project - please refer to Cocoapods documentation for details.

The integration of these items in the Podfile for this project is as follows:
```
pod 'Charts'
pod 'OpenSSL-Universal'
```

Details on use of each dependency and the Cocoapods manager itself can be found in the links already included.

## Features
This app features a main view with a room (instead of the other way around) where the cat is shown in a decorated space. Above this view is an area with current step count and distane covered, along with hearts (which symbolize consecutive days of care for the cat), and the current Paw Point total. Below are buttons for care actions, and links to the decor shop and paw point store. 

Small animations for the cat are displayed, some based on care actions the user has taken. 

Paw Points for walking are given when the app is first launched for the day, and are based on the previous day's steps. A small bonus may be present if the user has filled all seven of the care indication hearts as well.

Still below that lies a history button, which leads to the graph view with step history. Presuming the user has provided Healthkit access, this view will display step history. Tapping on a bar on the graph will supply details about that day. Miles is the default measurement - however, this can be toggled to meters on the info page for the app, if desired.

The decor shop allows a user to spend their Paw Points, and get new colors or styles of items to add to their cat's room. Points are stored in Core Data and updated accordingly. Sound feedback is supplied in the shop depending on if the point quantity is sufficient for a purchase or not. Purchased items can then be equipped by tapping them (blue background indicates current equipments). These equipment selections are also saved in Core Data so they are maintained across device launches.

The Paw Points show contains in-app purchases which use Storekit and a product request to retrieve items. A notice is displayed if the device does not support purchases, and a network monitor ensures the presence of a network connection before attempting a request. Upon success of the purchase, the receipt is validated, and if valid, the user is then credited with the appropriate number of Paw Points.

A brief tutorial is shown at app launch, which walks a user through the app. This tutorial can be relaunched at any time from the settings page.

## Art
Various art is included in this app, from the cat and its animation to all of its associated decors item, to provide a lightheartedness and friendly, encouraging environment. This art was created by myself (the developer) and belongs to no one else. The cat pictured - Lucy - is based on a real-life feline, to whom credit for inspiration goes.

## Support
If you experience trouble using the app, have any questions, or simply want to contact me, you can contact me via email at kduncanwelke@gmail.com. I will be happy to discuss this project.

## Acknowledgement
Some inspiration for this app came from a group of friends - my thanks go out to them for helping provide thoughts that led to this app coming to realization. Sounds for this app came from [Zapsplat](zapsplat.com), and Mark DiAngelo and Popup Pixels on [Soundbible](soundbible.com).
