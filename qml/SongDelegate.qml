import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import com.iktwo.components 1.0
import "components" as ThisComponents
import "components/style.js" as Style

Item {
    id: root

    signal addToPlaylist()
    signal download()
    signal pressAndHold()

    function colorForKbps(kbps) {
        // 320, 256, 192, 128, 64
        if (kbps === 0)
            return "#2c3e50"
        else if (kbps < 64)
            return "#e74c3c"
        else if (kbps < 112)
            return "#d35400"
        else if (kbps < 128)
            return "#f39c12"
        else if (kbps < 192)
            return "#e67e22"
        else if (kbps < 256)
            return "#48C9B0"
        else if (kbps < 320)
            return "#27ae60"
        else
            return "#2ecc71"
    }

    height: 64 * ui.dpMultiplier + 1 * ui.dpMultiplier
    width: parent.width

    MouseArea {
        anchors.fill: parent
        onPressAndHold: root.pressAndHold()
    }

    Label {
        id: songName

        anchors {
            top: parent.top; topMargin: 12 * ui.dpMultiplier
            right: labelKbps.left; rightMargin: 4 * ui.dpMultiplier
            left: parent.left; leftMargin: 8 * ui.dpMultiplier
        }

        font {
            pixelSize: 18 * ui.dpMultiplier
            weight: Font.Light
        }

        color: Style.TEXT_COLOR_DARK
        elide: Text.ElideRight
        text: model.name + " - <i>" + model.group + "</i>"
        // TODO: add a dialog to show full name in case it's too long ???
    }

    Rectangle {
        anchors {
            fill: labelKbps
            topMargin: -labelKbps.height * 0.05
            bottomMargin: -labelKbps.height * 0.05
            leftMargin: -labelKbps.width * 0.05
            rightMargin: -labelKbps.width * 0.05
        }

        radius: height * 0.1
        color: colorForKbps(model.kbps)
    }

    Label {
        id: labelKbps

        anchors {
            verticalCenter: songName.verticalCenter
            right: row.left; rightMargin: 4 * ui.dpMultiplier
        }

        font {
            pixelSize: 12 * ui.dpMultiplier
            weight: Font.Light
        }

        color: Style.TEXT_COLOR_LIGHT
        elide: Text.ElideRight
        text: model.kbps + "kbps"
        //width: parent.width
        // TODO: add a dialog to show full name in case it's too long ???
    }

    Label {
        anchors {
            bottom: divider.top; bottomMargin:  12 * ui.dpMultiplier
            right: row.left; rightMargin: 4 * ui.dpMultiplier
            left: parent.left; leftMargin: 8 * ui.dpMultiplier
        }

        font {
            pixelSize: 12 * ui.dpMultiplier
            weight: Font.Light
        }

        elide: Text.ElideRight
        color: Style.TEXT_SECONDARY_COLOR_DARK
        text: model.length + " - <i>" + model.comment + "</i>"
        width: parent.width
    }

    BusyIndicator {
        anchors {
            top: row.top
            bottom: row.bottom
            right: row.right
            margins: 4 * ui.dpMultiplier
        }
        running: model.url === ""
        width: height
        opacity: 0.4
        style: BusyIndicatorStyle {
            indicator: Image {
                id: busyIndicator
                visible: control.running
                height: control.height
                width: control.width
                source: "qrc:/images/" + ui.getBestIconSize(height) + "busy_dark"
                antialiasing: true
                RotationAnimator {
                    target: busyIndicator
                    running: control.running
                    loops: Animation.Infinite
                    duration: 2000
                    from: 0; to: 360
                }
            }
        }
    }

    RowLayout {
        id: row

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right; rightMargin: 8 * ui.dpMultiplier
        }

        spacing: 4 * ui.dpMultiplier
        width: spacing + (48 * ui.dpMultiplier * 2)

        ImageButton {
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            width: 48 * ui.dpMultiplier
            source: "qrc:/images/" + ui.getBestIconSize(Math.min(icon.height, icon.width)) + "add_to_playlist"
            visible: model.url === "" ? false : true

            onClicked: root.addToPlaylist()
        }

        ImageButton {
            anchors {
                top: parent.top
                bottom: parent.bottom
            }

            width: 48 * ui.dpMultiplier

            source: "qrc:/images/" + ui.getBestIconSize(Math.min(icon.height, icon.width)) + "download"
            visible: model.url === "" ? false : true

            onClicked: root.download()
        }
    }

    ThisComponents.Divider { id: divider; anchors.bottom: parent.bottom }
}
