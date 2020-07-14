import QtQuick 2.0
import SddmComponents 2.0
import QtQuick.Layouts 1.0
import QtQuick.VirtualKeyboard 2.15
import QtQuick.VirtualKeyboard.Styles 2.15
import QtQuick.Window 2.2

Rectangle {
    id: container
    anchors.fill: parent

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.Tile
        onStatusChanged: {
            if (status == Image.Error) {
                color = "grey"
            }
        }
    }


    ColumnLayout{
        property int heightModifier: 0;
        property var startupFinished: false
        id: thisColumn
        width:parent.width
        Behavior on height {
            id: heightBehaviour
            enabled: false
            PropertyAnimation {} }
        height: loginPrompt.animationHack
                ? thisColumn.height
                : ( parent.height + heightModifier - (
                       (virtualKeyboard.keyboardActive && ( config.keyboardMoveWindow == "true" ) && startupFinished)
                        ? virtualKeyboard.implicitHeight*0.40
                        : 0))

            LoginPrompt{
                id: loginPrompt
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: 577
                Layout.preferredHeight:  275
                opacity: 0
                Component.onCompleted: {
                    if(config.startupAnimationFade == "true"){
                        loginPromptFade.start();
                    }else{
                        opacity = 1;
                    }
                }

                PropertyAnimation {
                    id: loginPromptFade
                    target: loginPrompt
                    property: "opacity"
                    to: 1
                    easing.type: Easing.InQuint
                    duration: 500
                }
            }

            PauseAnimation {
                id: startupPause
                duration: 400
            }

            PropertyAnimation {
                id: moveColumn
                target: thisColumn
                property: "heightModifier"
                from: -loginPrompt.height*1.7
                to: 0
                duration: 400
            }

            Component.onCompleted: {
                if(config.startupAnimationMove == "true"){
                    moveColumn.start();
		}else{
                    startupPause.start();
                }
            }

            Connections{
                target: moveColumn
                onFinished: {
                    thisColumn.startupFinished = true;
                    heightBehaviour.enabled = true;
                }
            }

            Connections{
                target: startupPause
                onFinished: {
                    thisColumn.startupFinished = true;
                    heightBehaviour.enabled = true;
                }
            }

    }


        Connections{
            target: loginPrompt
            onOpenKeyboard: virtualKeyboard.show()
            onCloseKeyboard: virtualKeyboard.hide()
        }

    Loader {
        id: virtualKeyboard
        z: 200
        anchors.fill:parent
        state: "hidden"
        source: "VirtualKeyboard.qml"
        property bool keyboardActive: item ? item.active : false
        onKeyboardActiveChanged: state = keyboardActive ? "visible" : "hidden"
        function show() {
            state = "visible";
            Qt.inputMethod.show();
            virtualKeyboard.item.activated = true;
        }
        function hide() {
            state = "hidden";
            Qt.inputMethod.hide();
            virtualKeyboard.item.activated = false;
        }
    }

    Component.onCompleted: {
        loginPrompt.sessionBox.model = sessionModel;
        loginPrompt.sessionBox.currentIndex =  sessionModel.lastIndex;
    }

}
