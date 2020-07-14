import QtQuick 2.4
import QtQuick.Shapes 1.10

Item {
    id: root
    property var borderColor: "#000000"
    property var lightFrameColor: "#e5e5e5"
    property var darkFrameColor: "#4d4d4d"
    property var boxColor: "#bebebe"
    property var frameSize: 5
    property var borderSize: 1

    Rectangle {
        anchors.fill: parent
        color: root.lightFrameColor
        border.width: 0
    }

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: root.borderSize + root.frameSize
        anchors.leftMargin: root.borderSize + root.frameSize
        color: root.darkFrameColor
        border.width: 0
    }

    Shape {
        anchors.fill: root
        ShapePath {
            strokeWidth: 0
            strokeColor: "transparent"
            fillColor: root.darkFrameColor
            startX: 0
            startY: root.height
            PathLine {
                x: 0
                y: root.height
            }
            PathLine {
                x: (root.borderSize + root.frameSize)
                y: root.height - (root.borderSize + root.frameSize)
            }
            PathLine {
                x: (root.borderSize + root.frameSize)
                y: root.height
            }
        }
    }
    Shape {
        anchors.fill: root
        ShapePath {
            strokeWidth: 0
            strokeColor: "transparent"
            fillColor: root.darkFrameColor
            startX: root.width
            startY: 0
            PathLine {
                x: root.width
                y: 0
            }
            PathLine {
                y: (root.borderSize + root.frameSize)
                x: root.width - (root.borderSize + root.frameSize)
            }
            PathLine {
                y: (root.borderSize + root.frameSize)
                x: root.width
            }
        }
    }

    Rectangle {
        id: loginBox
        color: "#00ffffff"
        radius: 0
        anchors.fill: parent
        border.color: root.borderColor
        border.width: root.borderSize
    }

    Rectangle {
        id: contentBox
        color: root.boxColor
        anchors.margins: root.borderSize + root.frameSize
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/

