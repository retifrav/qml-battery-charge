INTRO
====

This package contains QUItBatteryComponent with few usage examples.
To use it in your own software, copy qml/QUItBattery/QUItBatteryComponent
directory which contains the components and import that in your own QML files.

RUNNING
======

To run this application you need Qt 5.0.0 or newer:
- http://qt-project.org
- http://qt.gitorious.org/qt/qt5

There are two different ways to run the application:

1) If your target platform contains 'qmlscene' binary, just use it:
---
cd QUItBattery
[path to Qt5]/qtbase/bin/qmlscene qml/QUItBattery/main.qml
---

2) Alternatively, a simple launcher is provided to start the application:
---
cd QUItBattery
[path to Qt5]/qtbase/bin/qmake
make
./QUItBattery
---

The run application in fullscreen mode, use '--fullscreen' parameter for 
qmlscene. If you want to tweak the window resolution,
modify 'width' and 'height' properties in main.qml

LICENSE
======

Source codes are licensed under a Creative Commons Attribution 3.0 Unported 
License. http://creativecommons.org/licenses/by/3.0/

No attribution required, but feel free to mention us or 
contact info@quitcoding.com

Original battery icon by Pratheek N Prasanth http://prath33k.deviantart.com
