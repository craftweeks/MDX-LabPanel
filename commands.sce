global X Y Z z0 V sON XMAX YMAX isReset isDirectGo COM_NUM
X = %nan;
Y = %nan;
Z = %nan;
z0 = %nan;
V = 15;
SON = 1;
XMAX = 203.2;
YMAX = 152.4;
ZMAX = 60.5;
isReset = 0;
isDirectGo = 0; // get(handles.checkbox1, 'value');
COM_NUM = 4;

function home_callback()
    //Write your callback for  home  here
    if isReset == 0 then
        reset_callback();
    end

    disp('home')
    global X Y Z
    X = 0.0; Y = 0.0; Z = 0.0+z0;
    str_cmd = '^DF;!MC1;!PZ0,0;V15.0;Z0,0,0;!MC0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;';
    send_cmd(str_cmd);
    update_pos_show(X,Y,Z)
    updateAxisXY(X,Y)
endfunction

function send_cmd(str_cmd)
    global isReset
    if isReset ==1 then
        if (getos() == "Windows") then 
            fd = mopen(TMPDIR+'/text_mputl.txt','wt');
            mputl(str_cmd,fd);
            mclose(fd);
            s = sprintf('type %s\\text_mputl.txt > com%d', TMPDIR, COM_NUM);
            [output,bOK] = dos(s ,'-echo')
        end
    end
endfunction

function update_pos_show(x,y,z)
   global X Y Z
   X = x;
   Y = y;
   Z = z;
   set(handles.editboxX, 'String', msprintf('%.3f',X));
   set(handles.editboxY, 'String', msprintf('%.3f',Y));
   set(handles.editboxZ, 'String', msprintf('%.3f',Z));
endfunction

function [sx, sy, sz] = scale(x,y,z)
    ratio = 40;
    sx =  x*ratio;
    sy =  y*ratio;
    sz =  z*ratio;
endfunction

function new_cmd = make_cmd(sx,sy,sz)
    global V SON
new_cmd = '^DF;!MC'+ msprintf('%d',SON) +';!PZ0,0;V'+ msprintf('%.1f',V) +';Z' + msprintf('%.3f',sx) + ',' + msprintf('%.3f',sy) + ','+ msprintf('%.3f',sz) + ';!MC0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;';
endfunction

function relative_move(dx,dy,dz)
    global X Y Z
    x1 = dx + X
    y1 = dy + Y
    z1 = dz + Z
    if x1 > XMAX then
        x1 = XMAX;
    end
    if y1 > YMAX then
        y1 = YMAX;
    end
    if z1 > 0 - z0 then
        z1 = 0 -z0;
    end
    if x1 < 0 then
        x1 = 0;
    end
    if y1 < 0 then
        y1 = 0;
    end
    if z1 < -ZMAX then
        z1 = -ZMAX;
    end
    if (x1 == X & y1 == Y & z1 == Z) then
        disp('Zero Displacement')
       // set(handles.messagebox, 'String', 'Zero Displacement');
    else
        updateAxisXY(x1,y1);
        update_pos_show(x1,y1,z1)
        if get(handles.checkbox1, 'value') == 1 then
            [sx,sy,sz] = scale(x1,y1,z1-z0);
            new_cmd = make_cmd(sx,sy,sz);
            disp(new_cmd)
            send_cmd(new_cmd);
        end        
    end
endfunction

function reset_callback()
    //Write your callback for  reset  here
    disp('Reset')
    //set(handles.ZOpos, 'String', '')
    global Z z0 isReset
    Z = 0.0; z0 = 0.0;
    str_cmd = ';;^IN;!MC0;^PA;!ZO0;;;^IN;!MC0;';
    isReset = 1;
    send_cmd(str_cmd);
    update_pos_show(X,Y,Z)
    set(handles.pushbuttonGO, 'Enable','on')
    //zPostion = findobj("tag" , "ZPostion");
    //set(handles.ZOpos, 'String', 'Z0 = ' + msprintf('%.3f',z0) +' mm');
endfunction


function left01mm_callback()
//Write your callback for  left1mm  here
    disp('-x 0.1mm')
    relative_move(-0.10, 0, 0);
endfunction

function right01mm_callback()
    //Write your callback for  right1mm  here
    disp('+x 0.1mm')
    relative_move(0.10, 0, 0);
endfunction


function in01mm_callback()
//Write your callback for  in1mm  here
    disp('-y 0.1mm')
    relative_move(0, -0.1, 0);
endfunction


function out01mm_callback()
//Write your callback for  out1mm  here
    disp('+y 0.1mm')
    relative_move(0, 0.1, 0);
endfunction

function left1mm_callback()
//Write your callback for  left1mm  here
    disp('-x 1mm')
    relative_move(-1, 0, 0);
endfunction

function right1mm_callback()
    //Write your callback for  right1mm  here
    disp('+x 1mm')
    relative_move(1, 0, 0);
endfunction


function in1mm_callback()
//Write your callback for  in1mm  here
    disp('-y 1mm')
    relative_move(0, -1, 0);
endfunction


function out1mm_callback()
//Write your callback for  out1mm  here
    disp('+y 1mm')
    relative_move(0, +1, 0);
endfunction

function left10mm_callback()
//Write your callback for  left1mm  here
    disp('-x 10mm')
    relative_move(-10, 0, 0);
endfunction

function right10mm_callback()
    //Write your callback for  right1mm  here
    disp('+x 10mm')
    relative_move(10, 0, 0);
endfunction


function in10mm_callback()
//Write your callback for  in1mm  here
    disp('-y 10mm')
    relative_move(0, -10, 0);
endfunction


function out10mm_callback()
//Write your callback for  out1mm  here
    disp('+y 10mm')
    relative_move(0, +10, 0);
endfunction

function left1step_callback()
//Write your callback for  left1mm  here
    disp('-x 1 step')
    relative_move(-0.025, 0, 0);
endfunction

function right1step_callback()
    //Write your callback for  right1mm  here
    disp('+x 1 step')
    relative_move(0.025, 0, 0);
endfunction


function in1step_callback()
//Write your callback for  in1mm  here
    disp('-y 1 step')
    relative_move(0, -0.025, 0);
endfunction


function out1step_callback()
//Write your callback for  out1mm  here
    disp('+y 1 step')
    relative_move(0, +0.025, 0);
endfunction

function up1step_callback()
//Write your callback for  in1mm  here
    disp('+z 1 step')
    relative_move(0, 0, 0.025);
endfunction


function down1step_callback()
//Write your callback for  out1mm  here
    disp('-z 1 step')
    relative_move(0, 0, -0.025);
endfunction

function up01mm_callback()
//Write your callback for  in1mm  here
    disp('+z 0.1 mm')
    relative_move(0, 0, 0.10);
endfunction


function down01mm_callback()
//Write your callback for  out1mm  here
    disp('-z 0.1 mm')
    relative_move(0, 0, -0.10);
endfunction

function up1mm_callback()
//Write your callback for  in1mm  here
    disp('+z 1 mm')
    relative_move(0, 0, 1);
endfunction


function down1mm_callback()
//Write your callback for  out1mm  here
    disp('-y 1 mm')
    relative_move(0, 0, -1);
endfunction

function up10mm_callback()
//Write your callback for  in1mm  here
    disp('+z 10 mm')
    relative_move(0, 0, 10);
endfunction


function down10mm_callback()
//Write your callback for  out1mm  here
    disp('-z 10 mm')
    relative_move(0, 0, -10);
endfunction


function setZO_callback()
//Write your callback for  out1mm  here
    global z0
    z0 = Z;
    disp('Set new ZO')
    //set(handles.messagebox, 'String', 'Set new Z0');
    set(handles.TextZO, 'String', 'Z0 = ' + msprintf('%.3f',z0) +' mm');
    [sx,sy,sz] = scale(X,Y,Z);
    str_cmd = '^DF;!ZO' + msprintf('%.3f',sz) + ';;';
    send_cmd(str_cmd);
endfunction

function directgo_callback()
//Write your callback for  directgo  here
    global isDirectGo
    isDirectGo = get(handles.checkbox1, 'value') 
    disp(isDirectGo)
endfunction


function go_callback()
//Write your callback for  go  here
    [sx,sy,sz] = scale(X,Y,Z-z0);
    new_cmd = make_cmd(sx,sy,sz);
    disp(new_cmd)
     send_cmd(new_cmd);
endfunction

function xminhome_callback()
    relative_move(-XMAX, 0, 0);
endfunction

function xmaxhome_callback()
    relative_move(XMAX, 0, 0);
endfunction

function yminhome_callback()
    relative_move(0, -YMAX, 0);
endfunction

function ymaxhome_callback()
    relative_move(0, YMAX, 0);
endfunction

function printer_callback()
    [output,bOK,exitcode]=dos('rundll32.exe printui.dll,PrintUIEntry /o /n '"Roland MODELA MDX-20'"','-echo')
endfunction

function editboxX_callback()
    global X;
    X = strtod(get(handles.editbox1, 'String'));
endfunction

function editboxY_callback()
    global Y;
    Y = strtod(get(handles.editbox2, 'String'));
endfunction

function editboxZ_callback()
        global Z;
    Z = strtod(get(handles.editbox3, 'String'));
endfunction

function spooler_callback()
    status = get(handles.pushbuttonSpooler, 'String')
    if strindex(status, 'Stop')>=0 then
		disp('net stop spooler')
        [output,bOK]=dos("net stop spooler",'-echo');
        set(handles.pushbuttonSpooler, 'String', 'Start Spool');
    else
		disp('net start spooler')
        [output,bOK]=dos("net start spooler",'-echo');
        set(handles.pushbuttonSpooler, 'String', 'Stop Spool');
    end
endfunction

function changeport_callback()
    global COM_NUM
    COM_NUM = get(handles.popupmenu1, 'Value')
endfunction

function help_callback()
    dos('start https://chriskyfung.github.io/modela_mdx-15_20_control_panel_scilab/')
endfunction

function setAsMDX15_callback()
    global XMAX YMAX
    XMAX = 152.4;
    YMAX = 101.6;
    updateAxisXY(0,0)
    set(handles.radiobuttonMDX20, 'Enable','off')
endfunction

function setAsMDX20_callback()
    global XMAX YMAX
    XMAX = 203.2;
    YMAX = 152.4;
    updateAxisXY(0,0)
    set(handles.radiobuttonMDX15, 'Enable','off')
endfunction

function velocity_callback()
    global V
    V = get(handles.hsliderV, 'Value');
endfunction

function checkboxSON_callback()
    global SON
    SON = get(handles.checkboxSON, 'Value');
endfunction

function updateAxisXY(x0,y0)
   set(handles.frameXY, 'Position', [0, 80-round(y0*(80/YMAX)), 198, 132])
   drawlater();
   plot(handles.axisXY, x0, y0, 'b*')
   isoview2(-2,XMAX, -2, YMAX);
   drawnow();
endfunction

function isoview2(xmin, xmax, ymin, ymax)
    version_numbers = getversion('scilab');
    if version_numbers(1) >= 6 then
        isoview on;
        replot([xmin, ymin, xmax, ymax],handles.axisXY)
    else
        isoview(xmin, xmax, ymin, ymax);
    end
endfunction
