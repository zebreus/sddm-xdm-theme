import QtQuick 2.4

Item {
    property var boxColor: "transparent"
    property var lightColor: "#e5e5e5"
    property var darkColor: "#4d4d4d"

    id: root

    Rectangle {
        id: middleBar
        anchors.fill: parent
        border.width: 0
        color: root.boxColor
    }

    Rectangle {
        id: topBar
        anchors.bottomMargin: (root.height / 4) * 3
        anchors.fill: parent
        border.width: 0
        color: root.darkColor
    }

    Rectangle {
        id: bottomBar
        anchors.topMargin: (root.height / 4) * 3
        anchors.fill: parent
        border.width: 0
        color: root.lightColor
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:10;height:480;width:640}
}
##^##*/

