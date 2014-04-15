import QtQuick 1.0

Rectangle {
    id: mainEditor
    height: 1000
    width: 1000
    color: "darkgrey"
    state: "MENU_CONTRACTED"

    property real partition: 1/4
    
    MenuBar {
        id: menuBar
        width: parent.width
        height: parent.height*partition
        //anchors.top: mainEditor.top
        z: 1
    }
    
    TextArea {
        id: textArea
        y: drawer.height
        width: parent.width
        height: parent.height - drawer.height
        
        fontColor: "black"
        editArea.font.pointSize: 12
        //anchors.bottom: mainEditor.bottom
    }
    
    Rectangle {
        id: drawer
        width: parent.width; height: parent.height/20
        color: "green"
        y: 0
        z: 1
        anchors.top: menuBar.bottom
        
        Text {
            id: discription
            text: "Menu"
            color: "red"
            font.bold: true
            //anchors.fill: drawer
            anchors.centerIn: drawer
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: parent.height
        }
        
        Image {
            id: "drawerArrowLeft"
            source: "../images/arrow40x40.png"
            width: parent.width/20; height: parent.height
            x: drawer.width/3
            fillMode: Image.PreserveAspectFit
            smooth: true
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Image {
            id: "drawerArrowRight"
            source: "../images/arrow40x40.png"
            width: parent.width/20; height: parent.height
            x: 2*drawer.width/3
            fillMode: Image.PreserveAspectFit
            smooth: true
            anchors.verticalCenter: parent.verticalCenter
        }

        
        MouseArea {
            id: visibilitySwithcingArea
            anchors.fill:parent
            onClicked: {
                if ( mainEditor.state == "MENU_CONTRACTED" ) {
                    mainEditor.state = "MENU_EXPANDED"
                }
                else if ( mainEditor.state == "MENU_EXPANDED" )  {
                    mainEditor.state = "MENU_CONTRACTED"
                }
            }
        }
    }
    
    states: [
        State {
            name: "MENU_EXPANDED"
            PropertyChanges { target: menuBar; y:0 }
            PropertyChanges { target: drawer; y: menuBar.height }
            PropertyChanges { target: textArea; y: menuBar.height + drawer.height; height: mainEditor.height - drawer.height - menuBar.height }
            PropertyChanges { target: drawerArrowLeft; rotation: 180 }
            PropertyChanges { target: drawerArrowRight; rotation: 180 }
        },
        State {
            name: "MENU_CONTRACTED"
            PropertyChanges { target: menuBar; y: -height; height: 0 }
            PropertyChanges { target: drawer; y: 0 }
            PropertyChanges { target: textArea; y: drawer.height; height: mainEditor.height - drawer.height }
            PropertyChanges { target: drawerArrowLeft; rotation: 0 }
            PropertyChanges { target: drawerArrowRight; rotation: 0 }
        }
    ]
    
    transitions: [
        Transition {
            to: "*"
            NumberAnimation { target: menuBar; properties: "y, height"; duration: 200 }
            NumberAnimation { target: drawer; properties: "y"; duration: 200 }
            NumberAnimation { target: textArea; properties: "y, height"; duration: 200 }
            NumberAnimation { property: "rotation"; duration: 200; easing.type: Easing.OutExpo }
        }
    ]
}
