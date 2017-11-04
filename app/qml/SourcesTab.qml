/****************************************************************************
 * This file is part of App Center.
 *
 * Copyright (C) 2016 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:GPL3+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 2.0
import Fluid.Controls 1.0 as FluidControls
import Liri.AppCenter 1.0 as AppCenter

FluidControls.Tab {
    title: qsTr("Sources")

    ListView {
        anchors.fill: parent

        model: softwareManager.sourcesModel
        section.delegate: FluidControls.Subheader {
            text: section
        }
        section.property: "section"
        delegate: FluidControls.ListItem {
            leftItem: CheckBox {
                anchors.verticalCenter: parent.verticalCenter
                checked: model.enabled
                onCheckedChanged: model.source.enabled = checked
            }
            text: qsTr("%1 (%2)").arg(model.title).arg(model.name)
            subText: model.url
        }
    }
}
