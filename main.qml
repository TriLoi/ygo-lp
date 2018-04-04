import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 320
    height: 560
    title: qsTr("Yugioh Life Point")
    color: "#eeeeee"

    function _setEnableNumber() {
        //Use in _resetDamage() and onClickSign()
        button_0.enabled = damage_sign.text !== "/";
        button_1.enabled = damage_sign.text !== "/";
        button_2.enabled = damage_sign.text !== "/";
        button_3.enabled = damage_sign.text !== "/";
        button_4.enabled = damage_sign.text !== "/";
        button_5.enabled = damage_sign.text !== "/";
        button_6.enabled = damage_sign.text !== "/";
        button_7.enabled = damage_sign.text !== "/";
        button_8.enabled = damage_sign.text !== "/";
        button_9.enabled = damage_sign.text !== "/";
        button_00.enabled = damage_sign.text !== "/";
        button_C.enabled = damage_sign.text !== "/";
    }

    function _resetDamage(){
        //Use in onClickLp() and onClickReset()
        damage_sign.text = "-";
        damage_number.text = "";

        _setEnableNumber();
    }

    function _concatToDamage(end){
        //Use in onClickNumber() and onClick00()
        var damage = damage_number.text + end;

        if(damage<10000){
            damage_number.text = damage;
            return 0;
        }

        return -1;
    }

    function onClickLp() {
        switch(damage_sign.text){
        case "/":
            this.text = this.text / (damage_number.text*1);
            break;
        case "-":
        case "+":
            var damage = (damage_sign.text==="-")?-1:1;
            damage *= damage_number.text;

            if(damage>-100 && damage<100){
                damage *= 100;
            }

            var lpLeft = this.text*1 + damage;
            this.text = lpLeft<0 ? 0 : lpLeft;
            break;
        }
        _resetDamage();
    }

    function onClickReset() {
        lp_j1.text = lp_j2.text = 8000;
        _resetDamage();
    }

    function onClickSign() {
        switch(this.text){
        case "-":
            this.text = "+";
            break;
        case "+":
            this.text = "/";
            damage_number.text = 2; //force the entry to "2" for state "/"
            break;
        default:
            this.text = "-";
            damage_number.text = ""; //remove "2" of previous state "/"
        }
        _setEnableNumber();
    }

    function onClickNumber() {
        _concatToDamage(this.text);
    }

    function onClick00() {
        if(_concatToDamage(this.text) !== 0){
            _concatToDamage("0");
        }
    }

    function onClickC() {
        damage_number.text = "";
    }

    GridLayout {
        id: layout_app
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 15
        anchors.topMargin: 15
        rowSpacing: 0
        anchors.fill: parent
        rows: 4
        columns: 1

        GridLayout {
            id: layout_lps
            columnSpacing: 10
            rows: 1
            columns: 2

            Layout.column: 0
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: lp_j1
                text: qsTr("8000")
                font.pointSize: 30
                spacing: 3
                onClicked: {
                    onClickLp();
                }

                Layout.row: 0
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: lp_j2
                text: qsTr("8000")
                font.pointSize: 30
                onClicked: {
                    onClickLp();
                }

                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        GridLayout {
            id: layout_extra
            columnSpacing: 0
            rowSpacing: 0
            scale: 0.4
            rows: 1
            columns: 1

            Layout.row: 1
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: button_reset
                text: qsTr("Reset")
                font.pointSize: 30
                onClicked: { onClickReset(); }

                Layout.row: 0
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        GridLayout {
            id: layout_damage
            scale: 0.8
            columnSpacing: 0
            rowSpacing: 0
            rows: 1
            columns: 2

            Layout.row: 2
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: damage_sign
                text: qsTr("-")
                font.pointSize: 30
                onClicked: { onClickSign(); }

                Layout.row: 0
                Layout.column: 0
                Layout.fillHeight: true
            }

            Rectangle {
                id: damage_number_zone
                color: "#ffffff"
                Text {
                    id: damage_number
                    lineHeight: 0.9
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                    font.pointSize: 30
                    anchors.fill: parent
                }

                Layout.row: 0
                Layout.column: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }

        GridLayout {
            id: layout_buttons
            scale: 0.85
            columnSpacing: 20
            rowSpacing: 15
            rows: 4
            columns: 3

            Layout.row: 3
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: button_7
                text: qsTr("7")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 0
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_8
                text: qsTr("8")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_9
                text: qsTr("9")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 0
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_4
                text: qsTr("4")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 1
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_5
                text: qsTr("5")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 1
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_6
                text: qsTr("6")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 1
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_1
                text: qsTr("1")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 2
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_2
                text: qsTr("2")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 2
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_3
                text: qsTr("3")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 2
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_00
                text: qsTr("00")
                font.pointSize: 30
                onClicked: { onClick00(); }

                Layout.row: 3
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_0
                text: qsTr("0")
                font.pointSize: 30
                onClicked: { onClickNumber(); }

                Layout.row: 3
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_C
                text: qsTr("C")
                font.pointSize: 30
                onClicked: { onClickC(); }

                Layout.row: 3
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
