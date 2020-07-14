import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.VirtualKeyboard 2.2
import QtQuick.VirtualKeyboard.Styles 2.2

InputPanel {
    property SequentialAnimation openAnimation
    property SequentialAnimation closeAnimation

    id: inputPanel
    property bool activated: false
    active: activated && Qt.inputMethod.visible
    //height: 100
    visible: false
    onActiveChanged: {
        if(active){
            closeAnimation.stop();
            if(config.keyboardOpenAnimation == "true"){
                openAnimation.restart();
            }else{
                keyboard.style.keyboardRelativeBottomMargin = 0.05
                keyboard.style.keyboardRelativeLeftMargin = 0.2
                keyboard.style.keyboardRelativeRightMargin = 0.2
                keyboard.style.keyboardRelativeTopMargin = 0.25
                visible = true;
            }
        }else{
            if(config.keyboardCloseAnimation == "true"){
                closeAnimation.restart();
            }else{
                visible = false;
            }
        }
    console.log("visible changed")
    }

    Component.onCompleted: {
        visible = false
        keyboard.style.keyboardBackground = null;
        keyboard.style.selectionListBackground = null;
        keyboard.style.keyboardRelativeBottomMargin = 0.0
        keyboard.style.keyboardRelativeLeftMargin = 0
        keyboard.style.keyboardRelativeRightMargin = 0.8
        keyboard.style.keyboardRelativeTopMargin = 1
        keyboard.style.keyboardHeight = 100

        var seqAnimation1 = Qt.createQmlObject("import QtQuick 2.2; SequentialAnimation {}", inputPanel);

        var propAnimation5 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", seqAnimation1);
        propAnimation5.to = true;
        propAnimation5.target = inputPanel;
        propAnimation5.property = "visible";
        propAnimation5.duration = 0;

        var parAnimation1 = Qt.createQmlObject("import QtQuick 2.2; ParallelAnimation {}", seqAnimation1);
        var propAnimation1 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation1);
        propAnimation1.to = 0.25;
        //propAnimation1.easing.type = Easing.OutBack;
        propAnimation1.target = keyboard.style;
        propAnimation1.property = "keyboardRelativeTopMargin";
        propAnimation1.duration = 200;

        var propAnimation2 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation1);
        propAnimation2.to = 0.2;
        propAnimation2.target = keyboard.style;
        //propAnimation2.easing.type = Easing.OutInBack;
        propAnimation2.property = "keyboardRelativeLeftMargin";
        propAnimation2.duration = 200;

        var propAnimation3 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation1);
        propAnimation3.to = 0.2;
        propAnimation3.target = keyboard.style;
        propAnimation2.easing.type = Easing.OutBack
        propAnimation3.property = "keyboardRelativeRightMargin";
        propAnimation3.duration = 200;

        var propAnimation4 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation1);
        propAnimation4.to = 0.05;
        propAnimation4.target = keyboard.style;
        //propAnimation2.easing.type = Easing.OutInBack
        propAnimation4.property = "keyboardRelativeBottomMargin";
        propAnimation4.duration = 200;

        var animations = [];
        animations.push(propAnimation1);
        animations.push(propAnimation2);
        animations.push(propAnimation3);
        animations.push(propAnimation4);
        parAnimation1.animations = animations;

        var animations1 = [];
        animations1.push(propAnimation5)
        animations1.push(parAnimation1)

        seqAnimation1.animations = animations1;

        openAnimation = seqAnimation1;


        var seqAnimation2 = Qt.createQmlObject("import QtQuick 2.2; SequentialAnimation {}", inputPanel);

        var parAnimation2 = Qt.createQmlObject("import QtQuick 2.2; ParallelAnimation {}", seqAnimation2);
        var propAnimation12 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation2);
        propAnimation12.to = 1.0;
        propAnimation12.target = keyboard.style;
        propAnimation12.property = "keyboardRelativeTopMargin";
        propAnimation12.duration = 200;

        var propAnimation22 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation2);
        propAnimation22.to = 0.8;
        propAnimation22.target = keyboard.style;
        propAnimation22.property = "keyboardRelativeLeftMargin";
        propAnimation22.duration = 200;

        var propAnimation32 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation2);
        propAnimation32.to = 0.0;
        propAnimation32.target = keyboard.style;
        propAnimation32.property = "keyboardRelativeRightMargin";
        propAnimation32.duration = 200;

        var propAnimation42 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation2);
        propAnimation42.to = 0.00;
        propAnimation42.target = keyboard.style;
        propAnimation42.property = "keyboardRelativeBottomMargin";
        propAnimation42.duration = 200;

        var propAnimation52 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", seqAnimation2);
        propAnimation52.to = false;
        propAnimation52.target = inputPanel;
        propAnimation52.property = "visible";
        propAnimation52.duration = 0;

        var animations2 = [];
        animations2.push(propAnimation12);
        animations2.push(propAnimation22);
        animations2.push(propAnimation32);
        animations2.push(propAnimation42);

        parAnimation2.animations = animations2;

        var parAnimation3 = Qt.createQmlObject("import QtQuick 2.2; ParallelAnimation {}", seqAnimation2);
        var propAnimation13 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation3);
        propAnimation13.to = 1;
        propAnimation13.target = keyboard.style;
        propAnimation13.property = "keyboardRelativeTopMargin";
        propAnimation13.duration = 0;

        var propAnimation23 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation3);
        propAnimation23.to = 0;
        propAnimation23.target = keyboard.style;
        propAnimation23.property = "keyboardRelativeLeftMargin";
        propAnimation23.duration = 0;

        var propAnimation33 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation3);
        propAnimation33.to = 0.8;
        propAnimation33.target = keyboard.style;
        propAnimation33.property = "keyboardRelativeRightMargin";
        propAnimation33.duration = 0;

        var propAnimation43 = Qt.createQmlObject("import QtQuick 2.2; PropertyAnimation {}", parAnimation3);
        propAnimation43.to = 0.0;
        propAnimation43.target = keyboard.style;
        propAnimation43.property = "keyboardRelativeBottomMargin";
        propAnimation43.duration = 0;

        var animations4 = [];
        animations4.push(propAnimation13);
        animations4.push(propAnimation23);
        animations4.push(propAnimation33);
        animations4.push(propAnimation43);
        parAnimation3.animations = animations4;

        var animations3 = [];
        animations3.push(parAnimation2);
        animations3.push(propAnimation52);
        animations3.push(parAnimation3);

        seqAnimation2.animations = animations3;

        closeAnimation = seqAnimation2;
    }

}
