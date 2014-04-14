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
				console.log( "Copy Button has been pressed" );
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
				console.log( "Cut Button has been pressed" );
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
				console.log( "Paste Button has been pressed" );
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
				console.log( "Select All button has been pressed" );
			}
		}
	}
}

