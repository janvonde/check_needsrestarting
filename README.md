# check_needsrestarting
 
This is a monitoring plugin for [icinga](https://www.icinga.com) to check if programms need to be restarted on CentOS or other RHEL based distributions.


### Requirements
This script only works on CentOS or other RHEL based distributions. You need to install the `yum-goodies` package.


### Usage
Try the plugin at the command line like this:
```
sudo ./check_needsrestarting.sh
```


You can define the icinga2 check command as follows:
```
/* Define check command for check_needsrestarting */
object CheckCommand "needsrestarting" {
  import "plugin-check-command"
  command = [ "/usr/bin/sudo", PluginDir + "/check_needsrestarting.sh" ]
}
```


### License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

