import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtQuick 2.5
import fan.qt.complex 1.0 as TApi


//import Qt.labs.controls.material 1.0
//import Qt.labs.controls.universal 1.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id: mainwindow
    visible: true
    width: 800
    height: 600
    title: qsTr("Hello World")
    //flags: Qt.FramelessWindowHint | Qt.Dialog
    property string msg: "empty"
    property var clickPos: null

    signal webSocketReceivedData(var message);

    Settings {
        id: settings
        property string styles: "Material"
    }

    Connections {
        target: __network__
        onWebSocketReceivedData: {
            console.log("#websocket received message________________________________:" + message)
            msgDisplay.text = message
            var json = JSON.parse(message)

            if(json.action == "device.info.read"){

                var data = {action:"device.info.read"}
                data.data={ip:"192.168.1.29",serial:"46463216",group:"group2",name:"dev29",password:"123456",check:false,initial:false,program:"",username:"",initialstage:0,version:""}
                __network__.sendMessage(JSON.stringify(data));
            }




            if(json.poweroff === true){
                console.log("poweroff = true")
                var a = TApi.PM.shutDown();
            }
        }
    }

    //    Rectangle{
    //        anchors.fill: parent

    //    }
    Image {
        anchors.fill: parent
        source: "/images/background.jpg"

    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            clickPos = Qt.point(mouse.x,mouse.y);
        }

        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y);
            mainwindow.setX(mainwindow.x+delta.x);
            mainwindow.setY(mainwindow.y+delta.y);
            //mainwindow.setWidth(mainwindow.width-delta.x);
            //mainwindow.setHeight(mainwindow.height-delta.y);
        }
    }

    ColumnLayout{
        x:10
        y:10
        Button{
            text:""
//            background : Image {
//                source: "qrc:/images/btnshutdown.png"
//            }

            //onClicked: TApi.PM.shutDown();
        }

        Button{
//            background : Image {
//                Layout.alignment: Qt.AlignHCenter
//                source: "/images/btnturnon.png"
//            }
            //onClicked: TApi.PM.restart();
        }
        Label {
            id:msgDisplay
            text: msg
            font.pixelSize: 32
            //anchors.centerIn: parent
        }
        Button{
            text:"button1"
        }
        Switch{
            //text:"switch1"
        }
        GroupBox{
            Button{
                text:'ok'
            }
        }
    }

    Button{
        x: parent.width - width/3
        y: 0
        text:""
//        background : Image {
//            //anchors.centerIn: parent
//            source: "qrc:/images/btnclose.png"
//        }

        onClicked: Qt.quit();
        //        onReleased: text = "re"
        //        MouseArea{
        //            anchors.fill: parent
        //        }
    }
}
