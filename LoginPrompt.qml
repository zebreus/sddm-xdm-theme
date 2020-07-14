
import QtQuick 2.4
import QtQuick.Window 2.2
import SddmComponents 2.0

LoginPromptForm {

    signal openKeyboard()
    signal closeKeyboard()

    property bool animationHack: false

    TextConstants { id: textConstants }

    //property var mySddm: sddm

    //property alias sessionBox: myLoginPrompt.sessionBox
    property var myVirtualKeyboard
    property alias verticalSpacing: myLoginPrompt.verticalSpacing
    property alias maxImageSize: myLoginPrompt.maxImageSize
    loginText: textConstants.login
    passwordText: textConstants.password
    sessionText: textConstants.session
    welcomeText: textConstants.welcomeText.arg(sddm.hostName)
    id: myLoginPrompt
    //anchors.fill: parent

    loginField.text: userModel.lastUser

    Connections{
        target: passwordKeyboardField
        onPressed:{
            console.log("openit")
            openKeyboard();
            passwordField.focus = true
        }
    }

    Connections{
        target: loginKeyboardField
        onPressed:{
            console.log("openit")
            openKeyboard();
            loginField.focus = true
        }
    }


    Connections {
        target: sddm

        onLoginSucceeded: {
            loginField.readOnly = false;
            passwordField.readOnly = false;
        }

        onLoginFailed: {
            passwordField.text = ""
            loginField.readOnly = false;
            passwordField.readOnly = false;
            if(config.login == "true"){
                if(config.fancyLoginFailed == "true"){
                    schwummZurueck.start();
                }else{
                    boringSchwummZurueck.start();
                }
            }
        }
    }

    Connections {
        target: loginField

        onAccepted: {
            passwordField.focus = true;
        }
    }

    Connections {
        target: passwordField

        onAccepted: {
            initialX = x;
            loginField.readOnly = true;
            passwordField.readOnly = true;
            if (config.login == "true"){
                animationHack = true;
                schwumm.start();
            }else{
                sddm.login(loginField.text, passwordField.text, sessionBox.currentIndex)
            }
            //Login happens once the animation has finished
        }
    }

    Connections {
        target: schwumm
        onFinished: {
            sddm.login(loginField.text, passwordField.text, sessionBox.currentIndex)
        }
    }


    Connections {
        target: schwummZurueck
        onFinished: {
            animationHack = false;
        }
    }

    property int initialX;
    property int initialWidth;
    property int initialHeight;

    SequentialAnimation{
        id: schwumm
        ParallelAnimation {
            id: schwumm1
            PropertyAnimation {
                target: myLoginPrompt
                property: "x"
                from: myLoginPrompt.x
                to: myLoginPrompt.x - myLoginPrompt.width*0.1
                easing.type: Easing.OutCubic
                duration: 60
            }
            PropertyAnimation {
                target: myLoginPrompt
                property: "height"
                from: myLoginPrompt.height
                to: myLoginPrompt.height*1.1
                easing.type: Easing.OutCubic
                duration: 60
            }
            PropertyAnimation {
                target: myLoginPrompt
                property: "width"
                from: myLoginPrompt.width
                to: myLoginPrompt.width*0.9
                easing.type: Easing.OutCubic
                duration: 60
            }
        }
        ParallelAnimation {
            id: schwumm2
            PropertyAnimation {
                target: myLoginPrompt
                property: "x"
                to: myLoginPrompt.parent.width + myLoginPrompt.width/2
                easing.type: Easing.InExpo
                duration: 100
            }
            PropertyAnimation {
                target: myLoginPrompt
                property: "height"
                to: myLoginPrompt.height*0.8
                easing.type: Easing.InExpo
                duration: 100
            }
            PropertyAnimation {
                target: myLoginPrompt
                property: "width"
                to: myLoginPrompt.width*2
                easing.type: Easing.InExpo
                duration: 100
            }
        }
        PropertyAnimation {
            target: myLoginPrompt
            property: "height"
            to: myLoginPrompt.height
            easing.type: Easing.Linear
            duration: 0
        }
        PropertyAnimation {
            target: myLoginPrompt
            property: "width"
            to: myLoginPrompt.width
            easing.type: Easing.Linear
            duration: 0
        }
        RotationAnimation{
            target: myLoginPrompt
            to: 0
            duration: 0
        }
        PauseAnimation{
            duration: 30
        }
    }

    ParallelAnimation {
        id: schwummZurueck

        PropertyAnimation {
            target: myLoginPrompt
            property: "y"
            from: myLoginPrompt.y - 100
            to: myLoginPrompt.y
            easing.type: Easing.InBack
            duration: 500
            easing.overshoot: 10
        }
        PropertyAnimation {
            target: myLoginPrompt
            property: "x"
            to: initialX
            easing.type: Easing.OutQuad
            duration: 600
        }
        RotationAnimation{
            target: myLoginPrompt
            from: 0
            to: 360*2
            duration: 500
            easing.type: Easing.OutQuad
            direction: RotationAnimation.CounterClockwise
        }
    }

    ParallelAnimation {
        id: boringSchwummZurueck
        PropertyAnimation {
            target: myLoginPrompt
            property: "x"
            to: initialX
            easing.type: Easing.OutQuad
            duration: 600
        }
    }

    osImage.source: config.logo


    RotationAnimation {
        id: osImageRotate1
        target: osImage
        to: Math.floor(Math.random() * Math.floor(480)) + 120
        easing.type: Easing.OutBounce
        duration: 750
        direction: RotationAnimation.Counterclockwise
    }

    RotationAnimation {
        id: osImageRotate2
        target: osImage
        to: 720
        duration: 750
        easing.type: Easing.OutBounce
        direction: RotationAnimation.Counterclockwise
    }

    Connections {
        target: osImageTouchArea
        onPressed: {
            if (config.rotateLogo == "true"){
                if(osImage.rotation%720 == 0){
                    osImageRotate2.stop()
                    osImageRotate1.start()
                }else{
                    osImageRotate1.stop()
                    osImageRotate2.start()
                }
            }
        }
    }



    Component.onCompleted: {
        if (loginField.text == "")
            loginField.focus = true
        else
            passwordField.focus = true
    }

}
