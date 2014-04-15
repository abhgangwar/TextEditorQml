import QtQuick 1.0
import editor 1.0

Rectangle {
	id: fileMenu
	width: 700; height:300

    property real fraction: 1/13

	color: "white"

    FileActions {
    id: fileActions
    fileContent: ""
    }

	Row {
		anchors.centerIn: parent
		spacing: parent.width*fraction
		Button {
			id: openButton
            buttonWidth: 3*fileMenu.width*fraction
            buttonHeight: 8*fileMenu.height*fraction
			normalColor: "lightgrey"
			labelText: "Open"
			onButtonClick: {
                fileActions.open();
                textArea.textContent = fileActions.fileContent
			}
		}
		
		Button {
			id: saveButton
            buttonWidth: 3*fileMenu.width*fraction
            buttonHeight: 8*fileMenu.height*fraction
			normalColor: "grey"
			labelText: "Save"
			onButtonClick: {
                fileActions.fileContent = textArea.textContent
                fileActions.save()
			}
		}
		
		Button {
			id: exitButton
            buttonWidth: 3*fileMenu.width*fraction
            buttonHeight: 8*fileMenu.height*fraction
			normalColor: "darkgrey"
			labelText: "Exit"
			onButtonClick: {
				console.log( "Quitting..." );
				Qt.quit()
			}
		}
	}
}

