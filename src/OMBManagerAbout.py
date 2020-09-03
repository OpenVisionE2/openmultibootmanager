#!/usr/bin/python
# -*- coding: utf-8 -*-
#############################################################################
#
# Copyright (C) 2014 Impex-Sat Gmbh & Co.KG
# Written by Sandro Cavazzoni <sandro@skanetwork.com>
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#############################################################################

from Screens.Screen import Screen

from Components.ActionMap import ActionMap
from Components.Label import Label

from OMBManagerCommon import OMB_MANAGER_VERSION
from OMBManagerLocale import _
from OMBManagerInstall import OMB_GETBOXTYPE

class OMBManagerAbout(Screen):
	skin = """
			<screen position="center,center" size="560,400">
				<widget name="about"
						position="10,10"
						size="540,340"
						font="Regular;22"
						zPosition="1" />
			</screen>"""
			
	def __init__(self, session):
		Screen.__init__(self, session)
		
		self.setTitle(_('OpenMultiboot About'))
		
		about = "OpenMultiboot Manager " + OMB_MANAGER_VERSION + "\n"
		about += OMB_GETBOXTYPE + "\n"
		about += "Special version for Open Vision" + "\n"
		about += "(c) 2014 Impex-Sat Gmbh & Co.KG\n\n"
		about += "Written by Sandro Cavazzoni <sandro@skanetwork.com>"
		
		self['about'] = Label(about)
		self["actions"] = ActionMap(["SetupActions"],
		{
			"cancel": self.keyCancel
		})
		
	def keyCancel(self):
		self.close()
