/*
 * Created Date: June 7th 2017
 * Author: ky fung
 * 
 * Copyright (c) 2017-2019 Craftweeks CNC Group
 */

pathname = get_absolute_file_path('__main__.sce');
chdir(pathname);
exec ("commands.sce", -1);
exec ('ControlPanel.sce', -1);
