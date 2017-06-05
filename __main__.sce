pathname = get_absolute_file_path('__main__.sce');
chdir(pathname);
exec ("commands.sce", -1);
exec ('ControlPanel.sce', -1);
