#!/usr/bin/python
# -*- coding: utf-8 -*-
from __future__ import print_function
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

import sys
import boxbranding

KEYS_FNC_MAP = {
	'machine_mtd_kernel': 'boxbranding.getMachineMtdKernel()',
	'machine_kernel_file': 'boxbranding.getMachineKernelFile()',
	'machine_mtd_boot': 'boxbranding.getMachineMtdBoot()',
	'machine_mtd_root': 'boxbranding.getMachineMtdRoot()',
	'machine_root_file': 'boxbranding.getMachineRootFile()',
	'machine_mkubifs': 'boxbranding.getMachineMKUBIFS()',
	'machine_ubinize': 'boxbranding.getMachineUBINIZE()',
	'box_type': 'boxbranding.getBoxType()',
	'image_version': 'boxbranding.getImageVersion()',
	'image_build': 'boxbranding.getImageBuild()',
	'image_distro': 'boxbranding.getImageDistro()',
	'image_folder': 'boxbranding.getImageFolder()',
	'image_file_system': 'boxbranding.getImageFileSystem()'
}

def print_help():
	print('Syntax:')
	print(sys.argv[0] + ' enigma2_dir key')
	print('')
	print('Valid keys:')
	for key in KEYS_FNC_MAP.keys():
		print(' * ' + key)
	print(' * all')

if len(sys.argv) != 3:
	print_help()
else:
	sys.path.insert(0, sys.argv[1])

	if not sys.argv[2] in KEYS_FNC_MAP and sys.argv[2] != 'all':
		print_help()
	else:
		if sys.argv[2] == 'all':
			for key in KEYS_FNC_MAP.keys():
				print(key + ' = ' + eval(KEYS_FNC_MAP[key]))
		else:
			print(eval(KEYS_FNC_MAP[sys.argv[2]]))
