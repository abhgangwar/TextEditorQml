#ifndef EDITORDECLARATIVEPLUGIN_H
#define EDITORDECLARATIVEPLUGIN_H

#include <QDeclarativeExtensionPlugin>

class EditorDeclarativePlugin : public QDeclarativeExtensionPlugin
{
Q_OBJECT

public:
    virtual void registerTypes( const char *uri = "editor" );
};

#endif
