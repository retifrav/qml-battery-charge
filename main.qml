import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: mainView
    visible: true
    visibility: "FullScreen"

    Image {
        anchors.fill: parent
        source: "images/background2.jpg"
    }

    ColumnLayout
    {
        anchors.fill: parent

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top;
            anchors.topMargin: 30;
            source: "images/arrows.png"
            opacity: !rotateToggle.checked
            Behavior on opacity {
                NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
            }
            MouseArea {
                anchors.centerIn: parent
                width: battery.width
                height: 200
                enabled: !rotateToggle.checked
                onPositionChanged: {
                    battery.rotation = (mouseX - width*0.5)*0.2 - 90
                }
                onReleased: {
                    rotateBackAnimation.start();
                }
                onCanceled:  {
                    rotateBackAnimation.start();
                }
                onPressed: {
                    rotateBackAnimation.stop();
                }
            }
        }

        QUItBattery {
            id: battery
            anchors.centerIn: parent
            value: slider.value
            charging: chargingToggle.checked
            maxLiquidRotation: liquidToggle.checked ? 50 : 0
            rotation: -90
            SequentialAnimation on rotation {
                running: rotateToggle.checked
                loops: Animation.Infinite
                NumberAnimation { to: -120; duration: 2000; easing.type: Easing.InOutQuad }
                NumberAnimation { to: -70; duration: 1000; easing.type: Easing.InOutQuad }
            }
        }

        NumberAnimation {
            id: rotateBackAnimation
            target: battery
            property: "rotation"
            to: -90
            duration: 3000
            easing.type: Easing.OutElastic
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            spacing: 16

            Image {
                id: batteryBar
                anchors.verticalCenter: parent.verticalCenter
                source: "images/lightning.png"
            }
            Slider {
                anchors.verticalCenter: parent.verticalCenter
                id: slider
                width: 300
                value: 0.84
            }

            ToggleButton {
                id: chargingToggle
                icon: "images/plug.png"
            }
            ToggleButton {
                id: liquidToggle
                icon: "images/glass.png"
            }
            ToggleButton {
                id: rotateToggle
                icon: "images/rotate.png"
            }
        }
    }
}
