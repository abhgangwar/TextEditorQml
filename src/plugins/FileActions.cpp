#include "FileActions.h"
#include <QDebug>

FileActions::FileActions( QObject *parent )
    : QObject( parent )
{
// nothing to do
}

void FileActions::open()
{
    QWidget *widget = new QWidget();
    QString fileName = QFileDialog::getOpenFileName( widget, tr("Select a file to open..."), ".", tr("Text FIle (*.txt);;All Files(*.*)") );
    if ( !fileName.isNull() ) {
        QFile fIn( fileName );
        if ( !fIn.open( QIODevice::ReadOnly ) ) {
            QMessageBox::critical( widget, tr("File Read Error"), tr("File could not be opened") );
            return;
        }
        QTextStream in( &fIn );
        QString line;
        m_fileContent.clear();
        do {
            line = in.read( 100 );
            m_fileContent.append( line );
        } while( !line.isNull() );
        emit fileContentChanged();
        fIn.close();
    }
}

void FileActions::save()
{
    QWidget *widget = new QWidget();
    QString fileName = QFileDialog::getSaveFileName( widget, tr( "Save File"), ".", tr("Text Files (*.txt);;All Files(*.*)") );
    if ( !fileName.isNull() ) {
        QFile fOut( fileName );
        if ( !fOut.open( QIODevice::WriteOnly ) ) {
            QMessageBox::critical( widget, tr("File Write Error"), tr("File could not be saved") );
            return;
        }
        QTextStream out( &fOut );
        out << m_fileContent;
    }
}

QString FileActions::fileContent() const
{
    return m_fileContent;
}

void FileActions::setFileContent( QString &contents )
{
    m_fileContent = contents;
    emit fileContentChanged();
}
