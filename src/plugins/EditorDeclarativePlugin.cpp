#include "EditorDeclarativePlugin.h"
#include "FileActions.h"

#include <qdeclarative.h>

void EditorDeclarativePlugin::registerTypes( const char *uri )
{
    uri = "editor";
    qmlRegisterType<FileActions>( uri, 1, 0, "FileActions" );
}

Q_EXPORT_PLUGIN2( EditorDeclarativePlugin, EditorDeclarativePlugin )
