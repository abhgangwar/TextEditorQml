import QtQuick 1.0

Rectangle {
    id: button
    property int buttonWidth: 150
    property int buttonHeight: 75
    
	property color normalColor: "lightblue"
    property color onHoverColor: "crimson"
    property color borderColor: "transparent"

    //property alias label: label
    property string labelText
    property real labelSize: buttonWidth < buttonHeight ? buttonWidth/3 : buttonHeight/3
    property alias labelColor: label.color

    signal buttonClick()
	
	border { width: 2; color: borderColor }
	
	Text {
		id: label
		text: labelText
		color: "lightyellow"
		font.pixelSize: parent.labelSize
		anchors.centerIn: parent
	}
	
	MouseArea {
		id: buttonMouseArea
		onClicked: buttonClick()
		hoverEnabled: true
		
		onEntered: parent.border.color = parent.onHoverColor
		onExited: parent.border.color = parent.borderColor
		anchors.fill: parent
	}
	
	width: buttonWidth; height: buttonHeight
	color: buttonMouseArea.pressed ? Qt.darker( normalColor, 1.5 ) : normalColor	
	Behavior on color { ColorAnimation{ duration: 50 } }
	
	scale: buttonMouseArea.pressed ? 1.1 : 1.0
    Behavior on scale { NumberAnimation{ duration: 50 } }
    
    radius: 6
}
