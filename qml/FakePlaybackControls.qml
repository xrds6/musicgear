import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import QtMultimedia 5.1
import com.iktwo.components 1.0
import "components/style.js" as Style

Rectangle {
    property alias song: songLabel.text

    color: "#fafafa"
    height: column.height + 1 * ScreenValues.dpMultiplier
    width: parent.width

    ColumnLayout {
        id: column

        anchors {
            left: parent.left
            right: parent.right
        }

        ProgressBar {
            id: progressBar

            maximumValue: 414
            minimumValue: 0
            value: 210
            width: parent.width

            style: ProgressBarStyle {
                background: Rectangle {
                    color: Style.PROGRESS_BAR_BACKGROUND_LIGHT
                    implicitWidth: control.width
                    implicitHeight: 4 * ScreenValues.dpMultiplier
                }
                progress: Rectangle {
                    color: "#0066CC"
                }
            }
        }

        Item {
            height: playBtn.height

            anchors {
                left: parent.left
                right: parent.right
                margins: 1 * ScreenValues.dpMultiplier
            }

            RowLayout {
                anchors.fill: parent

                Label {
                    Layout.fillWidth: true
                    color: Style.TEXT_SECONDARY_COLOR_DARK
                    height: parent.height
                    verticalAlignment: "AlignVCenter"
                    text: "02:10"
                    renderType: Text.NativeRendering
                    font.pixelSize: 12 * ScreenValues.dpMultiplier
                }

                RowLayout {
                    spacing: 8 * ScreenValues.dpMultiplier

                    ImageButton {
                        id: previousBtn

                        height: 48 * ScreenValues.dpMultiplier
                        width: 48 * ScreenValues.dpMultiplier

                        source: "qrc:/images/" + Theme.getBestIconSize(Math.min(icon.height, icon.width)) + "previous"
                        enabled: false
                    }

                    ImageButton {
                        id: playBtn

                        height: 48 * ScreenValues.dpMultiplier
                        width: 48 * ScreenValues.dpMultiplier

                        source: "qrc:/images/" + Theme.getBestIconSize(Math.min(icon.height, icon.width)) + "pause"
                        enabled: false
                    }

                    ImageButton {
                        id: nextBtn

                        height: 48 * ScreenValues.dpMultiplier
                        width: 48 * ScreenValues.dpMultiplier

                        source: "qrc:/images/" + Theme.getBestIconSize(Math.min(icon.height, icon.width)) + "next"
                        enabled: false
                    }
                }

                Label {
                    Layout.fillWidth: true

                    color: Style.TEXT_SECONDARY_COLOR_DARK
                    text: "04:14"
                    horizontalAlignment: "AlignRight"
                    renderType: Text.NativeRendering
                    font.pixelSize: 12 * ScreenValues.dpMultiplier
                }
            }
        }

        Label {
            id: songLabel

            anchors {
                left: parent.left
                right: parent.right
                margins: 1 * ScreenValues.dpMultiplier
            }

            color: Style.TEXT_COLOR_DARK
            renderType: Text.NativeRendering
            font.pixelSize: 14 * ScreenValues.dpMultiplier
        }
    }
}
