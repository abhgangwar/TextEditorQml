#ifndef FILEACTIONS_H
#define FILEACTIONS_H

#include <QtGui>

class FileActions : public QObject
{    

    Q_OBJECT
    Q_PROPERTY( QString fileContent READ fileContent WRITE setFileContent NOTIFY fileContentChanged )

public: 
    explicit FileActions( QObject *parent = 0 );

    Q_INVOKABLE void open();
    Q_INVOKABLE void save();
    Q_INVOKABLE QString fileContent() const;
    Q_INVOKABLE void setFileContent( QString &contents );

Q_SIGNALS:
    void fileContentChanged();

private:
    QString m_fileContent;
};

#endif
