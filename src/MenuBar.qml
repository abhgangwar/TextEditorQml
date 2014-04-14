import QtQuick 1.0

Rectangle {
    id: menuBar
    width: 1000; height: 300
    property color fileColor: "blue"
    property color editColor: "deepskyblue"
    property real fraction: 1/10

    Column {
        spacing: 2
        z: 1
        // container for header which will contains menu items choices in menuBar
        Rectangle {
        id: menuListItems
            width: menuBar.width
            height:2* menuBar.height*fraction
            color: "yellow"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "green" }//#8C8F8C" }
                GradientStop { position: 0.17; color: "green" }//"#6A6D6A" }
                GradientStop { position: 0.98;color: "yellow" }//"#3F3F3F" }
                GradientStop { position: 1.0; color: "blue" }//"#0e1B20" }
            }

            
            Row {
                id: menuItems
                anchors.centerIn: parent
                spacing: 40

                Button {
                id: fileButton
                    buttonWidth: menuListItems.width*fraction; buttonHeight: menuListItems.height
                    normalColor: menuListView.currentIndex == 0 ? fileColor : Qt.darker( fileColor, 1.5 )
                    scale: menuListView.currentIndex == 0 ? 1.3 : 1
                    labelText: "File"
                    labelSize: menuListView.currentIndex == 0 ? 18 : 14
                    radius: 6
                    smooth: true
                    onButtonClick: {
                        menuListView.currentIndex = 0
                    }
                }
                Button {
                    id: editButton
                    buttonWidth: menuListItems.width*fraction; buttonHeight: menuListItems.height

                    normalColor: menuListView.currentIndex == 1 ? editColor : Qt.darker( editColor, 1.5 )
                    scale: menuListView.currentIndex == 1 ? 1.3 : 1
                    labelText: "Edit"
                    labelSize: menuListView.currentIndex == 1 ? 18 : 14
                    radius: 6
                    smooth: true;
                    onButtonClick: {
                        menuListView.currentIndex = 1
                    }
                }
            }
        }
        
        ListView {
            id: menuListView
            width: menuBar.width
            height: 8*menuBar.height*fraction
            
            model: menuListModel
            
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.DragAndOvershootBounds   // Other options are: DragOverBounds, StopAtBounds 
            
            flickDeceleration: 5000
            highlightFollowsCurrentItem: true
            highlightMoveDuration: 250
            highlightRangeMode: ListView.StrictlyEnforceRange
        }
    }
        
        VisualItemModel {
            id: menuListModel
            // this rectangle element is shown when no menu Item is active
            FileMenu {
                id: fileMenu
                width: menuListView.width
                height: menuListView.height
                color: fileColor
                gradient: Gradient {
                GradientStop { position: 0.0; color: "green" }//#8C8F8C" }
                GradientStop { position: 0.17; color: "green" }//"#6A6D6A" }
                GradientStop { position: 0.98;color: "yellow" }//"#3F3F3F" }
                GradientStop { position: 1.0; color: "blue" }//"#0e1B20" }
            }

            }
            EditMenu {
                id: editMenu
                width: menuListView.width
                height: menuListView.height
                color: editColor
                gradient: Gradient {
                GradientStop { position: 0.0; color: "green" }//#8C8F8C" }
                GradientStop { position: 0.17; color: "green" }//"#6A6D6A" }
                GradientStop { position: 0.98;color: "yellow" }//"#3F3F3F" }
                GradientStop { position: 1.0; color: "blue" }//"#0e1B20" }
            }

            }
        }
}
