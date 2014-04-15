import QtQuick 1.0

Rectangle {
	id: editMenu
	width: 700; height:300

    property real fraction: 1/17

	color: "white"

	Row {
		anchors.centerIn: parent
		spacing: editMenu.width*fraction
		Button {
			id: copyButton
            buttonWidth: 3*editMenu.width*fraction
            buttonHeight: 11*editMenu.height*fraction
			normalColor: "lightgrey"
			labelText: "Copy"
			onButtonClick: {
                textArea.editArea.copy()
			}
		}
		
		Button {
			id: cutButton
            buttonWidth: 3*editMenu.width*fraction
            buttonHeight: 11*editMenu.height*fraction
			normalColor: "lightgrey"
			labelText: "Cut"
			onButtonClick: {
                textArea.editArea.cut()
			}
		}
		
		Button {
			id: pasteButton
            buttonWidth: 3*editMenu.width*fraction
            buttonHeight: 11*editMenu.height*fraction
			normalColor: "grey"
			labelText: "Paste"
			onButtonClick: {
                textArea.editArea.paste()
			}
		}
		
		Button {
			id: selectAllButton
            buttonWidth: 3*editMenu.width*fraction
            buttonHeight: 11*editMenu.height*fraction
			normalColor: "darkgrey"
			labelText: "Select All"
			onButtonClick: {
                textArea.editArea.selectAll()
			}
		}
	}
}

