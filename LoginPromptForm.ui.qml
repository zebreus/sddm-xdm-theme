import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Item {

    property var verticalSpacing: 10
    property var maxImageSize: 0.76

    property var sessionModel
    property var loginText: "Login"
    property var passwordText: "Password"
    property var sessionText: "Session6"
    property var welcomeText: "Welcome to this computer"

    property var borderSize: 1
    property var frameSize: 5

    property alias passwordField: passwordField
    property alias loginField: loginField
    property alias sessionBox: sessionBox

    property alias loginKeyboardField: loginKeyboardField
    property alias passwordKeyboardField: passwordKeyboardField
    width: 778
    height: 455
    property alias osImage: osImage
    property alias osImageTouchArea: osImageTouchArea

    id: root
    LoginRectangle {
        borderSize: root.borderSize
        frameSize: root.frameSize
        anchors.fill: parent
    }
    //width: 577
    //height: 275
    //anchors.fill: parent
    RowLayout {
        id: rowLayout
        anchors.fill: parent
        anchors.topMargin: root.borderSize + root.frameSize
        anchors.bottomMargin: root.borderSize + root.frameSize
        spacing: root.verticalSpacing
        anchors.leftMargin: root.verticalSpacing + root.borderSize + root.frameSize
        anchors.rightMargin: root.verticalSpacing + root.borderSize + root.frameSize

        ColumnLayout {
            id: contentLayout
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.fillHeight: true
            //Layout.fillWidth: true
            Layout.preferredWidth: parent.width - osImage.Layout.preferredWidth

            Text {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.rightMargin: 10
                Layout.topMargin: 25
                Layout.bottomMargin: 23
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                id: titleText
                color: "#0000cd"
                font.pixelSize: 24
                font.letterSpacing: 0
                font.italic: true
                text: root.welcomeText

                horizontalAlignment: Text.AlignHCenter
                lineHeight: 1
                textFormat: Text.PlainText
                renderType: Text.NativeRendering
            }

            Divider {
                id: divider
                Layout.fillWidth: true
                Layout.preferredHeight: 4
                Layout.maximumHeight: 4
                Layout.minimumHeight: 4
            }

            ColumnLayout {
                id: columnLayout1
                Layout.topMargin: 13
                Layout.fillHeight: true
                Layout.fillWidth: true

                RowLayout {
                    id: loginRow
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        Layout.preferredWidth: 27
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignRight
                        id: label
                        text: root.loginText + ":"
                        color: "#000000"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    TextField {
                        id: loginField
                        //Layout.maximumWidth: loginRow.width * 0.54
                        Layout.fillWidth: true
                        Layout.preferredWidth: 54
                        background: LoginRectangle {
                            borderColor: "transparent"
                            darkFrameColor: "#e5e5e5"
                            lightFrameColor: "#4d4d4d"
                            boxColor: "#bebebe"
                            borderSize: 0
                            frameSize: 2
                        }
                        KeyNavigation.backtab: sessionBox
                        KeyNavigation.tab: passwordField
                        MultiPointTouchArea {
                            anchors.fill: parent
                            id: loginKeyboardField
                            mouseEnabled: false
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 17
                    }
                }

                RowLayout {
                    id: passwordRow
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        Layout.preferredWidth: 27
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignRight
                        id: passwordLabel
                        text: root.passwordText + ":"
                        color: "#000000"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    TextField {
                        id: passwordField
                        Layout.fillWidth: true
                        Layout.preferredWidth: 54
                        echoMode: TextInput.Password
                        background: LoginRectangle {
                            borderColor: "transparent"
                            darkFrameColor: "#e5e5e5"
                            lightFrameColor: "#4d4d4d"
                            boxColor: "#bebebe"
                            borderSize: 0
                            frameSize: 2
                        }
                        KeyNavigation.backtab: loginField
                        KeyNavigation.tab: sessionBox

                        MultiPointTouchArea {
                            anchors.fill: parent
                            id: passwordKeyboardField
                            mouseEnabled: false
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 17
                    }
                }

                RowLayout {
                    id: sessionRow
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        Layout.preferredWidth: 27
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignRight
                        id: sessionLabel
                        text: root.sessionText + ":"
                        color: "#000000"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    ComboBox {
                        id: sessionBox
                        Layout.fillWidth: true
                        Layout.preferredWidth: 54
                        font.pixelSize: 16
                        Layout.preferredHeight: passwordField.height

                        background: LoginRectangle {
                            borderColor: "transparent"
                            darkFrameColor: "#e5e5e5"
                            lightFrameColor: "#4d4d4d"
                            boxColor: "#bebebe"
                            borderSize: 0
                            frameSize: 2
                        }

                        //arrowIcon: "angle-down.png"
                        model: sessionModel

                        textRole: 'name'

                        //index: sessionModel.lastIndex
                        KeyNavigation.backtab: passwordField
                        KeyNavigation.tab: loginField
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 17
                    }
                }
            }
        }

        Image {
            id: osImage
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            //Layout.topMargin: 20
            //Layout.bottomMargin: 20
            Layout.preferredHeight: parent.height * root.maxImageSize
            Layout.preferredWidth: ((parent.height * root.maxImageSize)
                                    / sourceSize.height) * sourceSize.width
            source: "xorg.png"
            fillMode: Image.PreserveAspectFit
            MultiPointTouchArea {
                anchors.fill: parent
                id: osImageTouchArea
                mouseEnabled: true
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
