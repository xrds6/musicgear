#include <QDebug>
#include "song.h"

Song::Song(QObject *parent)
    : QObject(parent)
{
}

Song::Song(const QString &name, const QString &group, const QString &length,
           const QString &comment, int kbps, const QString &code, const QString &picture,
           QObject *parent)
    : QObject(parent),
      m_name(name),
      m_group(group),
      m_length(length),
      m_comment(comment),
      m_kbps(kbps),
      m_code(code),
      m_picture(picture)
{
}

QString Song::name() const
{
    return m_name;
}

void Song::setName(const QString &name)
{
    if (m_name == name)
        return;

    m_name = name;
    emit nameChanged();
}

QString Song::group() const
{
    return m_group;
}

void Song::setGroup(const QString &group)
{
    if (m_group == group)
        return;

    m_group = group;
    emit groupChanged();
}

QString Song::length() const
{
    return m_length;
}

void Song::setLength(const QString &length)
{
    if (m_length == length)
        return;

    m_length = length;
    emit lengthChanged();
}

QString Song::comment() const
{
    return m_comment;
}

void Song::setComment(const QString &comment)
{
    if (m_comment == comment)
        return;

    m_comment = comment;
    emit commentChanged();
}

QString Song::code() const
{
    return m_code;
}

void Song::setCode(const QString &code)
{
    if (m_code == code)
        return;

    m_code = code;
    emit codeChanged();
}

QString Song::url() const
{
    return m_url;
}

void Song::setUrl(const QString &url)
{
    if (m_url == url)
        return;

    m_url = url;
    emit urlChanged();
}

int Song::kbps() const
{
    return m_kbps;
}

void Song::setKbps(int kbps)
{
    if (m_kbps == kbps)
        return;

    m_kbps = kbps;
    emit kbpsChanged();
}

QString Song::picture() const
{
    return m_picture;
}

void Song::setPicture(const QString &picture)
{
    if (m_picture == picture)
        return;

    m_picture = picture;
    emit pictureChanged();
}
