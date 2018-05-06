import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import io.qt.view 1.0

View {
    id: view
    visible: true
    width: 360
    height: 630
    title: qsTr("Yugioh Life Point")
    color: "#eeeeee"

    property bool p_layout_buttons_enabled: true
    property string p_damage_sign_text: "-"
    property int p_damage_number_text: 0
    property int p_lp_j1_text: 8000
    property int p_lp_j2_text: 8000


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
                text: p_lp_j1_text
                font.pointSize: 30
                spacing: 3
                onClicked: { view.update_lpj1; }

                Layout.row: 0
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: lp_j2
                text: p_lp_j2_text
                font.pointSize: 30
                onClicked: { view.update_lpj2; }

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
            scale: 0.5
            rows: 1
            columns: 3

            Layout.row: 1
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Button {
                id: button_undo
                text: qsTr("<")
                font.pointSize: 30
                onClicked: { view.undo; }

                Layout.row: 0
                Layout.column: 0
                Layout.fillHeight: true
            }

            Button {
                id: button_reset
                text: qsTr("Reset")
                font.pointSize: 30
                onClicked: { view.reset; }

                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_redo
                text: qsTr(">")
                font.pointSize: 30
                onClicked: { view.redo; }

                Layout.row: 0
                Layout.column: 2
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
                text: p_damage_sign_text
                font.pointSize: 30
                onClicked: { view.change_damage_sign; }

                Layout.row: 0
                Layout.column: 0
                Layout.fillHeight: true
            }

            Rectangle {
                id: damage_number_zone
                color: "#ffffff"
                Text {
                    id: damage_number
                    text: p_damage_number_text
                    anchors.rightMargin: 20
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
            enabled: p_layout_buttons_enabled
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
                onClicked: { view.input_damage_number = "7"; }

                Layout.row: 0
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_8
                text: qsTr("8")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "8"; }

                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_9
                text: qsTr("9")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "9"; }

                Layout.row: 0
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_4
                text: qsTr("4")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "4"; }

                Layout.row: 1
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_5
                text: qsTr("5")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "5"; }

                Layout.row: 1
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_6
                text: qsTr("6")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "6"; }

                Layout.row: 1
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_1
                text: qsTr("1")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "1"; }

                Layout.row: 2
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_2
                text: qsTr("2")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "2"; }

                Layout.row: 2
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_3
                text: qsTr("3")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "3"; }

                Layout.row: 2
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_00
                text: qsTr("00")
                font.pointSize: 30
                onClicked: {
                    view.input_damage_number = "0";
                    view.input_damage_number = "0";
                }

                Layout.row: 3
                Layout.column: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_0
                text: qsTr("0")
                font.pointSize: 30
                onClicked: { view.input_damage_number = "0"; }

                Layout.row: 3
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: button_C
                text: qsTr("C")
                font.pointSize: 30
                onClicked: { view.reset_damage; }

                Layout.row: 3
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
