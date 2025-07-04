#!/bin/sh
#
# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    OpenMediaVault Plugin Developers <plugins@omv-extras.org>
# @copyright Copyright (c) 2024-2025 OpenMediaVault Plugin Developers
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

. /etc/default/openmediavault
. /usr/share/openmediavault/scripts/helper-functions

if ! omv_config_exists "/config/services/scripts"; then
  omv_config_add_node "/config/services" "scripts"
  omv_config_add_key "/config/services/scripts" "sharedfolderref" ""
  omv_config_add_key "/config/services/scripts" "scriptsowner" "root"
  omv_config_add_key "/config/services/scripts" "scriptsgroup" "root"
  omv_config_add_key "/config/services/scripts" "fileperms" "700"
  omv_config_add_key "/config/services/scripts" "logretentiontype" "daily"
  omv_config_add_key "/config/services/scripts" "logretentionlength" "14"
  omv_config_add_node "/config/services/scripts" "files"
  omv_config_add_node "/config/services/scripts" "jobs"
fi

exit 0
